package com.xeasywork.tinyflow.service.impl.ai;

import com.agentsflex.llm.openai.OpenAILlm;
import com.agentsflex.llm.openai.OpenAILlmConfig;
import com.agentsflex.llm.qwen.QwenLlm;
import com.agentsflex.llm.qwen.QwenLlmConfig;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.xeasywork.tinyflow.domain.ai.ApiKey;
import com.xeasywork.tinyflow.domain.ai.TinyFlow;
import com.xeasywork.tinyflow.mapper.ai.TinyFlowMapper;
import com.xeasywork.tinyflow.service.ai.IApiKeyService;
import com.xeasywork.tinyflow.service.ai.ITinyFlowService;
import dev.tinyflow.core.Tinyflow;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service
public class TinyFlowServiceImpl implements ITinyFlowService {

    @Resource
    private TinyFlowMapper tinyFlowMapper;

    @Resource
    private IApiKeyService apiKeyService;

    @Override
    public List<TinyFlow> selectTinyFlowList(TinyFlow tinyFlow) {
        return tinyFlowMapper.selectTinyFlowList(tinyFlow);
    }

    @Override
    public TinyFlow selectTinyFlowById(Long tfId) {
        return tinyFlowMapper.selectTinyFlowById(tfId);
    }

    @Override
    public int updateTinyFlow(TinyFlow tinyFlow) {
        return tinyFlowMapper.updateTinyFlow(tinyFlow);
    }

    @Override
    public int insertTinyFlow(TinyFlow tinyFlow) {
        return tinyFlowMapper.insertTinyFlow(tinyFlow);
    }

    @Override
    public void deleteTinyFlowByIds(Long[] ids) {
        for (Long id : ids) {
            tinyFlowMapper.deleteTinyFlowById(id);
        }
    }

    @Override
    public Object runFlow(TinyFlow tinyFlow) {
        Map<String, Object> variables = tinyFlow.getParam();
        Tinyflow tinyflow = parseFlowParam(tinyFlow.getGraph());
        return tinyflow.toChain().executeForResult(variables);
    }

    private Tinyflow parseFlowParam(String graph) {
        JSONObject json = JSONObject.parseObject(graph);
        JSONArray nodeArr = json.getJSONArray("nodes");
        for (int i = 0; i < nodeArr.size(); i++) {
            JSONObject node = nodeArr.getJSONObject(i);
            //  因为目前前端http节点有bug，获取不到url参数，此处先写死试用
            if (node.getString("type").equals("httpNode")) {
                node.getJSONObject("data").put("url", "http://127.0.0.1:8080/test/getData");
            }
        }
        Tinyflow  tinyflow = new Tinyflow(json.toJSONString());;
        for (int i = 0; i < nodeArr.size(); i++) {
            JSONObject node = nodeArr.getJSONObject(i);
            switch (node.getString("type")) {
                case "llmNode":
                    JSONObject data = node.getJSONObject("data");
                    ApiKey apiKey = apiKeyService.selectApiKeyById(data.getLong("llmId"));
                    switch (apiKey.getPlatform()) {
                        case "OpenAI":
                            OpenAILlmConfig openAILlmConfig = new OpenAILlmConfig();
                            tinyflow.setLlmProvider(id -> new OpenAILlm(openAILlmConfig));
                            break;
                        case "Ollama":
                            break;
                        case "YiYan":
                            break;
                        case "XingHuo":
                            break;
                        case "TongYi":
                            QwenLlmConfig qwenLlmConfig = new QwenLlmConfig();
                            qwenLlmConfig.setApiKey(apiKey.getApiKey());
                            qwenLlmConfig.setModel("qwen-plus");
                            tinyflow.setLlmProvider(id -> new QwenLlm(qwenLlmConfig));
                            break;
                        case "DeepSeek":
                            break;
                        case "ZhiPu":
                            break;
                    }
                    break;
                case "zsk":

                    break;
                default:
                    break;
            }
        }
        return tinyflow;
    }

}

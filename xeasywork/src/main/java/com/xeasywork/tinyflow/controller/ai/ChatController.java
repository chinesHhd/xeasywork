package com.xeasywork.tinyflow.controller.ai;

import com.agentsflex.core.llm.Llm;
import com.agentsflex.core.message.AiMessage;
import com.agentsflex.llm.qwen.QwenLlm;
import com.agentsflex.llm.qwen.QwenLlmConfig;
import com.xeasywork.tinyflow.common.util.StringUtils;
import com.xeasywork.tinyflow.domain.ai.ApiKey;
import com.xeasywork.tinyflow.domain.ai.ChatSessionDetail;
import com.xeasywork.tinyflow.service.ai.IApiKeyService;
import com.xeasywork.tinyflow.service.ai.IChatSessionDetailService;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import reactor.core.publisher.Flux;
import reactor.core.publisher.Sinks;

import javax.annotation.Resource;
import java.util.Date;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.atomic.AtomicInteger;

@RestController
@RequestMapping("/ai/chat")
public class ChatController {

    @Resource
    private IChatSessionDetailService chatSessionDetailService;

    @Resource
    private IApiKeyService apiKeyService;

    // 使用ConcurrentHashMap存储每个sessionId对应的sink
    private final ConcurrentHashMap<Long, Sinks.Many<String>> sessionSinks = new ConcurrentHashMap<>();

    /**
     * chat
     */
    @GetMapping(value = "/streamChat", produces = {MediaType.TEXT_EVENT_STREAM_VALUE})
    public Flux<String> streamChat(@RequestParam("text") String text, @RequestParam("modelId") Long modelId, @RequestParam("sessionId") Long sessionId) {
        System.out.println(modelId);
        ApiKey apiKey = apiKeyService.selectApiKeyById(modelId);
        QwenLlmConfig config = new QwenLlmConfig();
        config.setApiKey(apiKey.getApiKey());
        config.setModel(apiKey.getModel());
        Llm llm = new QwenLlm(config);
        saveAssistantMessage(sessionId, "user", text);
        // 获取或创建对应sessionId的sink
        Sinks.Many<String> sink = sessionSinks.computeIfAbsent(sessionId, id -> Sinks.many().multicast().onBackpressureBuffer());
        AtomicInteger flag = new AtomicInteger();
        StringBuilder sb = new StringBuilder();
        // 使用sink发布每一块AI响应
        llm.chatStream(text, (context, response) -> {
            AiMessage message = response.getMessage();
            if (StringUtils.isEmpty(message.getContent())) {
                flag.getAndIncrement();
            }
            sink.tryEmitNext(message.getContent() + "\n\n"); // 根据实际情况调整格式
            sb.append(message.getContent());
            if (flag.get() > 1) {
                sink.tryEmitNext("end\n\n");
                saveAssistantMessage(sessionId, "assistant", sb.toString());
            }
        });

        // 返回sink.asFlux()以允许客户端订阅
        return sink.asFlux();
    }

    // 保存 AI 消息的方法
    private void saveAssistantMessage(Long sessionId, String role, String fullContent) {
        ChatSessionDetail aiMsg = new ChatSessionDetail();
        aiMsg.setSessionId(sessionId);
        aiMsg.setRole(role);
        aiMsg.setContent(fullContent);
        aiMsg.setCreateTime(new Date());
        chatSessionDetailService.insertChatSessionDetail(aiMsg);
    }

}

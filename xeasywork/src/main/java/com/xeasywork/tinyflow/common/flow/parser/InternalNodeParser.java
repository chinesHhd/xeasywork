package com.xeasywork.tinyflow.common.flow.parser;

import com.agentsflex.core.chain.ChainNode;
import com.alibaba.fastjson.JSONObject;
import com.xeasywork.tinyflow.common.flow.node.InternalNode;
import dev.tinyflow.core.Tinyflow;
import dev.tinyflow.core.parser.BaseNodeParser;

public class InternalNodeParser extends BaseNodeParser {
    @Override
    public ChainNode parse(JSONObject jsonObject, Tinyflow tinyflow) {
        JSONObject data = getData(jsonObject);
        String engine = data.getString("engine");
        InternalNode internalNode = new InternalNode();
        internalNode.setMethodName(data.getString("method"));
        addParameters(internalNode, data);
        addOutputDefs(internalNode, data);
        return internalNode;
    }
}

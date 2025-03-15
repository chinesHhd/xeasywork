package com.xeasywork.tinyflow.service.ai;

import com.xeasywork.tinyflow.domain.ai.TinyFlow;

import java.util.List;

public interface ITinyFlowService {

    List<TinyFlow> selectTinyFlowList(TinyFlow tinyFlow);

    TinyFlow selectTinyFlowById(Long tfId);

    int updateTinyFlow(TinyFlow tinyFlow);

    int insertTinyFlow(TinyFlow tinyFlow);

    void deleteTinyFlowByIds(Long[] ids);

    Object runFlow(TinyFlow tinyFlow);

}

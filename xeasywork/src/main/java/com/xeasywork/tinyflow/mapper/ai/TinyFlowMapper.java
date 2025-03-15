package com.xeasywork.tinyflow.mapper.ai;

import com.xeasywork.tinyflow.domain.ai.TinyFlow;

import java.util.List;

public interface TinyFlowMapper {

    List<TinyFlow> selectTinyFlowList(TinyFlow tinyFlow);

    TinyFlow selectTinyFlowById(Long tfId);

    int updateTinyFlow(TinyFlow tinyFlow);

    int insertTinyFlow(TinyFlow tinyFlow);

    int deleteTinyFlowById(Long tfId);

}

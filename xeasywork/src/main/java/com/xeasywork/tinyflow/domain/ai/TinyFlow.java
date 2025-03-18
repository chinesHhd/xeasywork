package com.xeasywork.tinyflow.domain.ai;

import com.xeasywork.tinyflow.common.core.domain.BaseEntity;
import com.xeasywork.tinyflow.common.util.StringUtils;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.Map;

@Data
@EqualsAndHashCode(callSuper = true)
public class TinyFlow extends BaseEntity {

    private static final long serialVersionUID = 1L;
    private Long id;
    private String name;
    private String graph;
    private Map<String, Object> param;

    public String getGraph() {
        return StringUtils.isEmpty(graph) ? "{}" : graph;
    }
}

package com.xeasywork.tinyflow.domain.ai;

import com.xeasywork.tinyflow.common.core.domain.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = true)
public class ApiKey extends BaseEntity {

    private static final long serialVersionUID = 1L;
    private Long id;
    private String name;
    private String apiKey;
    private String platform;
    private String model;
    private String url;

}

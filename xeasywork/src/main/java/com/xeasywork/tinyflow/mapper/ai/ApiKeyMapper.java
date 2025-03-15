package com.xeasywork.tinyflow.mapper.ai;

import com.xeasywork.tinyflow.domain.ai.ApiKey;

import java.util.List;

public interface ApiKeyMapper {

    List<ApiKey> selectApiKeyList(ApiKey apiKey);

    ApiKey selectApiKeyById(Long id);

    int updateApiKey(ApiKey apiKey);

    int insertApiKey(ApiKey apiKey);

    int deleteApiKeyById(Long id);

}

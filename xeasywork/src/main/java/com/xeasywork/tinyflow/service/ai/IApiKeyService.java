package com.xeasywork.tinyflow.service.ai;

import com.xeasywork.tinyflow.domain.ai.ApiKey;

import java.util.List;
import java.util.Map;

public interface IApiKeyService {

    List<ApiKey> selectApiKeyList(ApiKey apiKey);

    ApiKey selectApiKeyById(Long id);

    int updateApiKey(ApiKey apiKey);

    int insertApiKey(ApiKey apiKey);

    void deleteApiKeyByIds(Long[] ids);

}

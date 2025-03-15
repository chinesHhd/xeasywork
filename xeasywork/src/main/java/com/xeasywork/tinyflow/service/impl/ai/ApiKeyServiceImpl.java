package com.xeasywork.tinyflow.service.impl.ai;

import com.xeasywork.tinyflow.domain.ai.ApiKey;
import com.xeasywork.tinyflow.mapper.ai.ApiKeyMapper;
import com.xeasywork.tinyflow.service.ai.IApiKeyService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class ApiKeyServiceImpl implements IApiKeyService {

    @Resource
    private ApiKeyMapper apiKeyMapper;

    @Override
    public List<ApiKey> selectApiKeyList(ApiKey apiKey) {
        return apiKeyMapper.selectApiKeyList(apiKey);
    }

    @Override
    public ApiKey selectApiKeyById(Long id) {
        return apiKeyMapper.selectApiKeyById(id);
    }

    @Override
    public int updateApiKey(ApiKey apiKey) {
        return apiKeyMapper.updateApiKey(apiKey);
    }

    @Override
    public int insertApiKey(ApiKey apiKey) {
        return apiKeyMapper.insertApiKey(apiKey);
    }

    @Override
    public void deleteApiKeyByIds(Long[] ids) {
        for (Long id : ids) {
            apiKeyMapper.deleteApiKeyById(id);
        }
    }
}

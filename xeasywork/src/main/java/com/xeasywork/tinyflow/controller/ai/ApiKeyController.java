package com.xeasywork.tinyflow.controller.ai;

import com.xeasywork.tinyflow.common.core.controller.BaseController;
import com.xeasywork.tinyflow.common.core.domain.AjaxResult;
import com.xeasywork.tinyflow.common.core.page.TableDataInfo;
import com.xeasywork.tinyflow.domain.ai.ApiKey;
import com.xeasywork.tinyflow.service.ai.IApiKeyService;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

/**
 * api 密钥管理
 */
@RestController
@RequestMapping("/ai/console/key")
public class ApiKeyController extends BaseController {
    
    @Resource
    private IApiKeyService apiKeyService;

    /**
     * 获取工作流列表
     */
    @PreAuthorize("@ss.hasPermi('ai:console:key:list')")
    @GetMapping("/list")
    public TableDataInfo list(ApiKey apiKey) {
        startPage();
        List<ApiKey> list = apiKeyService.selectApiKeyList(apiKey);
        return getDataTable(list);
    }

    /**
     * 获取工作流列表
     */
    @GetMapping("/allList")
    public AjaxResult allList(ApiKey apiKey) {
        List<ApiKey> list = apiKeyService.selectApiKeyList(apiKey);
        return AjaxResult.success(list);
    }

    /**
     * 新增工作流配置
     */
    @PreAuthorize("@ss.hasPermi('ai:console:key:add')")
    @PostMapping
    public AjaxResult add(@Validated @RequestBody ApiKey apiKey) {
        apiKey.setCreateBy(getUsername());
        return toAjax(apiKeyService.insertApiKey(apiKey));
    }

    /**
     * 修改工作流配置
     */
    @PreAuthorize("@ss.hasPermi('ai:console:key:edit')")
    @PutMapping
    public AjaxResult edit(@Validated @RequestBody ApiKey apiKey) {
        apiKey.setUpdateBy(getUsername());
        return toAjax(apiKeyService.updateApiKey(apiKey));
    }

    /**
     * 删除工作流配置
     */
    @PreAuthorize("@ss.hasPermi('ai:console:key:remove')")
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids) {
        apiKeyService.deleteApiKeyByIds(ids);
        return success();
    }

    /**
     * 根据编号获取详细信息
     */
    @PreAuthorize("@ss.hasPermi('ai:console:key:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable Long id) {
        return success(apiKeyService.selectApiKeyById(id));
    }

}

package com.xeasywork.tinyflow.controller.ai;

import com.xeasywork.tinyflow.common.core.controller.BaseController;
import com.xeasywork.tinyflow.common.core.domain.AjaxResult;
import com.xeasywork.tinyflow.common.core.page.TableDataInfo;
import com.xeasywork.tinyflow.domain.ai.TinyFlow;
import com.xeasywork.tinyflow.service.ai.ITinyFlowService;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

/**
 * ai 工作流
 */
@RestController
@RequestMapping("/ai/flow")
public class TinyFlowController extends BaseController {

    @Resource
    private ITinyFlowService tinyFlowService;

    /**
     * 获取工作流列表
     */
    @PreAuthorize("@ss.hasPermi('ai:flow:list')")
    @GetMapping("/list")
    public TableDataInfo list(TinyFlow tinyFlow) {
        startPage();
        List<TinyFlow> list = tinyFlowService.selectTinyFlowList(tinyFlow);
        return getDataTable(list);
    }

    /**
     * 新增工作流配置
     */
    @PreAuthorize("@ss.hasPermi('ai:flow:add')")
    @PostMapping
    public AjaxResult add(@Validated @RequestBody TinyFlow tinyFlow) {
        tinyFlow.setCreateBy(getUsername());
        return toAjax(tinyFlowService.insertTinyFlow(tinyFlow));
    }

    /**
     * 修改工作流配置
     */
    @PreAuthorize("@ss.hasPermi('ai:flow:edit')")
    @PutMapping
    public AjaxResult edit(@Validated @RequestBody TinyFlow tinyFlow) {
        tinyFlow.setUpdateBy(getUsername());
        return toAjax(tinyFlowService.updateTinyFlow(tinyFlow));
    }

    /**
     * 删除工作流配置
     */
    @PreAuthorize("@ss.hasPermi('ai:flow:remove')")
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids) {
        tinyFlowService.deleteTinyFlowByIds(ids);
        return success();
    }

    /**
     * 根据编号获取详细信息
     */
    @PreAuthorize("@ss.hasPermi('ai:flow:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable Long id) {
        return success(tinyFlowService.selectTinyFlowById(id));
    }

    /**
     * 流程运行
     * @param tinyFlow 工作流信息
     * @return 结果
     */
    @PostMapping("/goRun")
    public AjaxResult goRun(@Validated @RequestBody TinyFlow tinyFlow) {
        return success(tinyFlowService.runFlow(tinyFlow));
    }

}

package com.xeasywork.tinyflow.controller.ai;

import com.xeasywork.tinyflow.common.core.controller.BaseController;
import com.xeasywork.tinyflow.common.core.domain.AjaxResult;
import com.xeasywork.tinyflow.common.core.page.TableDataInfo;
import com.xeasywork.tinyflow.domain.ai.ChatSessionDetail;
import com.xeasywork.tinyflow.service.ai.IChatSessionDetailService;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

/**
 * 聊天会话详情Controller
 */
@RestController
@RequestMapping("/ai/detail")
public class ChatSessionDetailController extends BaseController {

    @Resource
    private IChatSessionDetailService chatSessionDetailService;

    /**
     * 查询聊天会话详情列表
     */
    @PreAuthorize("@ss.hasPermi('ai:detail:list')")
    @GetMapping("/list")
    public TableDataInfo list(ChatSessionDetail chatSessionDetail) {
        List<ChatSessionDetail> list = chatSessionDetailService.selectChatSessionDetailList(chatSessionDetail);
        return getDataTable(list);
    }
    /**
     * 获取聊天会话详情详细信息
     */
    @PreAuthorize("@ss.hasPermi('ai:detail:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id) {
        return success(chatSessionDetailService.selectChatSessionDetailById(id));
    }

    /**
     * 新增聊天会话详情
     */
    @PreAuthorize("@ss.hasPermi('ai:detail:add')")
    @PostMapping
    public AjaxResult add(@RequestBody ChatSessionDetail chatSessionDetail) {
        return toAjax(chatSessionDetailService.insertChatSessionDetail(chatSessionDetail));
    }

    /**
     * 修改聊天会话详情
     */
    @PreAuthorize("@ss.hasPermi('ai:detail:edit')")
    @PutMapping
    public AjaxResult edit(@RequestBody ChatSessionDetail chatSessionDetail) {
        return toAjax(chatSessionDetailService.updateChatSessionDetail(chatSessionDetail));
    }

    /**
     * 删除聊天会话详情
     */
    @PreAuthorize("@ss.hasPermi('ai:detail:remove')")
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids) {
        return toAjax(chatSessionDetailService.deleteChatSessionDetailByIds(ids));
    }
}

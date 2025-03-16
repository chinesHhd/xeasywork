package com.xeasywork.tinyflow.controller.ai;

import com.xeasywork.tinyflow.common.core.controller.BaseController;
import com.xeasywork.tinyflow.common.core.domain.AjaxResult;
import com.xeasywork.tinyflow.common.core.page.TableDataInfo;
import com.xeasywork.tinyflow.common.util.SecurityUtils;
import com.xeasywork.tinyflow.domain.ai.ChatSession;
import com.xeasywork.tinyflow.service.ai.IChatSessionService;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

/**
 * 聊天会话Controller
 */
@RestController
@RequestMapping("/ai/session")
public class ChatSessionController extends BaseController {

    @Resource
    private IChatSessionService chatSessionService;

    /**
     * 查询聊天会话列表
     */
    @PreAuthorize("@ss.hasPermi('ai:session:list')")
    @GetMapping("/list")
    public TableDataInfo list(ChatSession chatSession) {
        startPage();
        List<ChatSession> list = chatSessionService.selectChatSessionList(chatSession);
        return getDataTable(list);
    }

    /**
     * 获取聊天会话详细信息
     */
    @PreAuthorize("@ss.hasPermi('ai:session:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id) {
        return success(chatSessionService.selectChatSessionById(id));
    }

    /**
     * 新增聊天会话
     */
    @PreAuthorize("@ss.hasPermi('ai:session:add')")
    @PostMapping
    public AjaxResult add(@RequestBody ChatSession chatSession) {
        int row = chatSessionService.insertChatSession(chatSession);
        return toAjax(row);
    }

    /**
     * 修改聊天会话
     */
    @PreAuthorize("@ss.hasPermi('ai:session:edit')")
    @PutMapping
    public AjaxResult edit(@RequestBody ChatSession chatSession) {
        return toAjax(chatSessionService.updateChatSession(chatSession));
    }

    /**
     * 删除聊天会话
     */
    @PreAuthorize("@ss.hasPermi('ai:session:remove')")
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids) {
        return toAjax(chatSessionService.deleteChatSessionByIds(ids));
    }

    /**
     * 删除所有聊天会话
     */
    @PreAuthorize("@ss.hasPermi('ai:session:remove')")
    @DeleteMapping("/clean")
    public AjaxResult clean() {
        ChatSession query = new ChatSession();
        query.setUserId(SecurityUtils.getUserId());
        List<ChatSession> list = chatSessionService.selectChatSessionList(query);
        if (!CollectionUtils.isEmpty(list)) {
            return toAjax(chatSessionService.deleteChatSessionByIds(list.stream().map(ChatSession::getId).toArray(Long[]::new)));
        } else {
            return toAjax(0);
        }
    }
}

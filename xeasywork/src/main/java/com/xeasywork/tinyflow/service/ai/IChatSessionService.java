package com.xeasywork.tinyflow.service.ai;

import com.xeasywork.tinyflow.domain.ai.ChatSession;

import java.util.List;

/**
 * 聊天会话Service接口
 */
public interface IChatSessionService {
    /**
     * 查询聊天会话
     *
     * @param id 聊天会话主键
     * @return 聊天会话
     */
    ChatSession selectChatSessionById(Long id);

    /**
     * 查询聊天会话列表
     *
     * @param chatSession 聊天会话
     * @return 聊天会话集合
     */
    List<ChatSession> selectChatSessionList(ChatSession chatSession);

    /**
     * 新增聊天会话
     *
     * @param chatSession 聊天会话
     * @return 结果
     */
    int insertChatSession(ChatSession chatSession);

    /**
     * 修改聊天会话
     *
     * @param chatSession 聊天会话
     * @return 结果
     */
    int updateChatSession(ChatSession chatSession);

    /**
     * 批量删除聊天会话
     *
     * @param ids 需要删除的聊天会话主键集合
     * @return 结果
     */
    int deleteChatSessionByIds(Long[] ids);

    /**
     * 删除聊天会话信息
     *
     * @param id 聊天会话主键
     * @return 结果
     */
    int deleteChatSessionById(Long id);
}

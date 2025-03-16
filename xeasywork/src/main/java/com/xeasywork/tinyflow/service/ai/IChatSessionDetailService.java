package com.xeasywork.tinyflow.service.ai;

import com.xeasywork.tinyflow.domain.ai.ChatSessionDetail;

import java.util.List;

/**
 * 聊天会话详情Service接口
 */
public interface IChatSessionDetailService {
    /**
     * 查询聊天会话详情
     *
     * @param id 聊天会话详情主键
     * @return 聊天会话详情
     */
    ChatSessionDetail selectChatSessionDetailById(Long id);

    /**
     * 查询聊天会话详情列表
     *
     * @param chatSessionDetail 聊天会话详情
     * @return 聊天会话详情集合
     */
    List<ChatSessionDetail> selectChatSessionDetailList(ChatSessionDetail chatSessionDetail);

    /**
     * 新增聊天会话详情
     *
     * @param chatSessionDetail 聊天会话详情
     * @return 结果
     */
    int insertChatSessionDetail(ChatSessionDetail chatSessionDetail);

    /**
     * 修改聊天会话详情
     *
     * @param chatSessionDetail 聊天会话详情
     * @return 结果
     */
    int updateChatSessionDetail(ChatSessionDetail chatSessionDetail);

    /**
     * 批量删除聊天会话详情
     *
     * @param ids 需要删除的聊天会话详情主键集合
     * @return 结果
     */
    int deleteChatSessionDetailByIds(Long[] ids);

    /**
     * 删除聊天会话详情信息
     *
     * @param id 聊天会话详情主键
     * @return 结果
     */
    int deleteChatSessionDetailById(Long id);
}

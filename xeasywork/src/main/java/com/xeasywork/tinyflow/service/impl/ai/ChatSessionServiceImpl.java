package com.xeasywork.tinyflow.service.impl.ai;

import com.xeasywork.tinyflow.common.util.DateUtils;
import com.xeasywork.tinyflow.common.util.SecurityUtils;
import com.xeasywork.tinyflow.domain.ai.ChatSession;
import com.xeasywork.tinyflow.mapper.ai.ChatSessionMapper;
import com.xeasywork.tinyflow.service.ai.IChatSessionService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * 聊天会话Service业务层处理
 */
@Service
public class ChatSessionServiceImpl implements IChatSessionService {

    @Resource
    private ChatSessionMapper chatSessionMapper;

    /**
     * 查询聊天会话
     *
     * @param id 聊天会话主键
     * @return 聊天会话
     */
    @Override
    public ChatSession selectChatSessionById(Long id) {
        return chatSessionMapper.selectChatSessionById(id);
    }

    /**
     * 查询聊天会话列表
     *
     * @param chatSession 聊天会话
     * @return 聊天会话
     */
    @Override
    public List<ChatSession> selectChatSessionList(ChatSession chatSession) {
        return chatSessionMapper.selectChatSessionList(chatSession);
    }

    /**
     * 新增聊天会话
     *
     * @param chatSession 聊天会话
     * @return 结果
     */
    @Override
    public int insertChatSession(ChatSession chatSession) {
        chatSession.setUserId(SecurityUtils.getUserId());
        chatSession.setCreateTime(DateUtils.getNowDate());
        return chatSessionMapper.insertChatSession(chatSession);
    }

    /**
     * 修改聊天会话
     *
     * @param chatSession 聊天会话
     * @return 结果
     */
    @Override
    public int updateChatSession(ChatSession chatSession) {
        return chatSessionMapper.updateChatSession(chatSession);
    }

    /**
     * 批量删除聊天会话
     *
     * @param ids 需要删除的聊天会话主键
     * @return 结果
     */
    @Override
    public int deleteChatSessionByIds(Long[] ids) {
        return chatSessionMapper.deleteChatSessionByIds(ids);
    }

    /**
     * 删除聊天会话信息
     *
     * @param id 聊天会话主键
     * @return 结果
     */
    @Override
    public int deleteChatSessionById(Long id) {
        return chatSessionMapper.deleteChatSessionById(id);
    }
}

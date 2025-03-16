package com.xeasywork.tinyflow.service.impl.ai;

import com.xeasywork.tinyflow.common.util.DateUtils;
import com.xeasywork.tinyflow.domain.ai.ChatSessionDetail;
import com.xeasywork.tinyflow.mapper.ai.ChatSessionDetailMapper;
import com.xeasywork.tinyflow.service.ai.IChatSessionDetailService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * 聊天会话详情Service业务层处理
 */
@Service
public class ChatSessionDetailServiceImpl implements IChatSessionDetailService {

    @Resource
    private ChatSessionDetailMapper chatSessionDetailMapper;

    /**
     * 查询聊天会话详情
     *
     * @param id 聊天会话详情主键
     * @return 聊天会话详情
     */
    @Override
    public ChatSessionDetail selectChatSessionDetailById(Long id) {
        return chatSessionDetailMapper.selectChatSessionDetailById(id);
    }

    /**
     * 查询聊天会话详情列表
     *
     * @param chatSessionDetail 聊天会话详情
     * @return 聊天会话详情
     */
    @Override
    public List<ChatSessionDetail> selectChatSessionDetailList(ChatSessionDetail chatSessionDetail) {
        return chatSessionDetailMapper.selectChatSessionDetailList(chatSessionDetail);
    }

    /**
     * 新增聊天会话详情
     *
     * @param chatSessionDetail 聊天会话详情
     * @return 结果
     */
    @Override
    public int insertChatSessionDetail(ChatSessionDetail chatSessionDetail) {
        chatSessionDetail.setCreateTime(DateUtils.getNowDate());
        return chatSessionDetailMapper.insertChatSessionDetail(chatSessionDetail);
    }

    /**
     * 修改聊天会话详情
     *
     * @param chatSessionDetail 聊天会话详情
     * @return 结果
     */
    @Override
    public int updateChatSessionDetail(ChatSessionDetail chatSessionDetail) {
        return chatSessionDetailMapper.updateChatSessionDetail(chatSessionDetail);
    }

    /**
     * 批量删除聊天会话详情
     *
     * @param ids 需要删除的聊天会话详情主键
     * @return 结果
     */
    @Override
    public int deleteChatSessionDetailByIds(Long[] ids) {
        return chatSessionDetailMapper.deleteChatSessionDetailByIds(ids);
    }

    /**
     * 删除聊天会话详情信息
     *
     * @param id 聊天会话详情主键
     * @return 结果
     */
    @Override
    public int deleteChatSessionDetailById(Long id) {
        return chatSessionDetailMapper.deleteChatSessionDetailById(id);
    }
}

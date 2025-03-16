package com.xeasywork.tinyflow.domain.ai;

import com.xeasywork.tinyflow.common.core.domain.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 聊天会话详情对象 chat_session_detail
 */
@Data
@EqualsAndHashCode(callSuper = true)
public class ChatSessionDetail extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /**
     * 聊天会话详细ID
     */
    private Long id;

    /**
     * 聊天会话ID
     */
    private Long sessionId;

    /**
     * 会话角色 user:用户 ai:AI
     */
    private String role;

    /**
     * 聊天内容
     */
    private String content;

}

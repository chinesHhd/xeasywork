package com.xeasywork.tinyflow.domain.ai;

import com.xeasywork.tinyflow.common.core.domain.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 聊天会话对象 chat_session
 */
@Data
@EqualsAndHashCode(callSuper = true)
public class ChatSession extends BaseEntity {

    private static final long serialVersionUID = 1L;

    /**
     * 聊天会话Id
     */
    private Long id;

    /**
     * 用户ID
     */
    private Long userId;

    /**
     * 聊天会话名
     */
    private String title;

    /**
     * 聊天记忆
     */
    private String memory;

    /**
     * 模型id
     */
    private Integer modelId;

    /**
     * 模型平台
     */
    private String platform;

}

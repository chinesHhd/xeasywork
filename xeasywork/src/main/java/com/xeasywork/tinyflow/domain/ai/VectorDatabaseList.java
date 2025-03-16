package com.xeasywork.tinyflow.domain.ai;

import com.xeasywork.tinyflow.common.core.domain.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 向量库列表对象 vector_database_list
 */
@Data
@EqualsAndHashCode(callSuper = true)
public class VectorDatabaseList extends BaseEntity {

    private static final long serialVersionUID = 1L;

    /**
     * 向量数据库列表ID
     */
    private Long id;

    /**
     * 数据库别名
     */
    private String aliasName;

    /**
     * 数据库地址
     */
    private String host;

    /**
     * 数据库端口
     */
    private Integer port;

    /**
     * 数据库名
     */
    private String database;

    /**
     * 数据库表名称
     */
    private String table;

    /**
     * 数据库用户名
     */
    private String user;

    /**
     * 数据库密码
     */
    private String password;

    /**
     * 向量纬度
     */
    private Integer dimension;

    /**
     * 是否选择
     */
    private Boolean isChose;

}

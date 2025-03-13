package com.xeasywork.tinyflow.controller;

import com.xeasywork.tinyflow.common.config.XewConfig;
import com.xeasywork.tinyflow.common.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

/**
 * 首页
 */
@RestController
public class SysIndexController
{
    /** 系统基础配置 */
    @Resource
    private XewConfig config;

    /**
     * 访问首页，提示语
     */
    @RequestMapping("/")
    public String index()
    {
        return StringUtils.format("欢迎使用{}后台管理框架，当前版本：v{}，请通过前端地址访问。", config.getName(), config.getVersion());
    }
}

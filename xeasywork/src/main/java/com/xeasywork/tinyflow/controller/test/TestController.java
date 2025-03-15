package com.xeasywork.tinyflow.controller.test;

import com.xeasywork.tinyflow.common.core.controller.BaseController;
import com.xeasywork.tinyflow.common.core.domain.AjaxResult;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class TestController extends BaseController {

    @GetMapping("/test/getData")
    @ResponseBody
    public AjaxResult list() {
        List<Map<String, Object>> list = new ArrayList<>();
        Map<String, Object> m1 = new HashMap<>();
        m1.put("sp", "苹果");
        m1.put("pl", "这款苹果真好吃");
        list.add(m1);
        m1 = new HashMap<>();
        m1.put("sp", "苹果");
        m1.put("pl", "这款苹果真难吃");
        list.add(m1);
        m1 = new HashMap<>();
        m1.put("sp", "苹果");
        m1.put("pl", "这款苹果非常难吃，再也不想要了");
        list.add(m1);
        m1 = new HashMap<>();
        m1.put("sp", "苹果");
        m1.put("pl", "劝退，别买");
        list.add(m1);
        System.err.println("成功" + list);
        return AjaxResult.success(list);
    }

}

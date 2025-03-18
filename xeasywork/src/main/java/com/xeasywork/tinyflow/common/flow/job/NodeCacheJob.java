package com.xeasywork.tinyflow.common.flow.job;

import com.xeasywork.tinyflow.common.annotation.MethodName;
import com.xeasywork.tinyflow.common.flow.cache.MethodCache;
import org.reflections.Reflections;
import org.reflections.scanners.Scanners;
import org.reflections.util.ConfigurationBuilder;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import java.lang.annotation.Annotation;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

@Component
public class NodeCacheJob {

    @PostConstruct
    private void cacheMethodName() {
        scanForAnnotatedMethods("com.xeasywork.tinyflow", MethodName.class);
    }

    private static void scanForAnnotatedMethods(String packageName, Class<? extends Annotation> annotation) {
        List<String> result = new ArrayList<>();
        // 配置Reflections实例以扫描指定包下的所有类
        Reflections reflections = new Reflections(new ConfigurationBuilder()
                .forPackages(packageName)
                .addScanners(Scanners.TypesAnnotated, Scanners.MethodsAnnotated));

        // 查找标注了特定注解的所有方法
        Set<Method> methods = reflections.getMethodsAnnotatedWith(annotation);

        // 输出这些方法的名字
        for (Method method : methods) {
            MethodCache.putMethodCache(method.getName(), method);
        }
    }
}

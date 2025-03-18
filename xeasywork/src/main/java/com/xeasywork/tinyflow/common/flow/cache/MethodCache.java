package com.xeasywork.tinyflow.common.flow.cache;

import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

public class MethodCache {

        private static final ConcurrentHashMap<String, Method> cache = new ConcurrentHashMap<>();

    public static Method getMethodCache(String methodName) {
        return cache.get(methodName);
    }

    public static void putMethodCache(String methodName, Method method) {
        cache.put(methodName, method);
    }

    public static List<String> getMethodNames() {
        return new ArrayList<>(cache.keySet());
    }

}

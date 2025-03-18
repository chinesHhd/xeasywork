package com.xeasywork.tinyflow.common.flow.node;

import com.agentsflex.core.chain.Chain;
import com.agentsflex.core.chain.Parameter;
import com.agentsflex.core.chain.node.BaseNode;
import com.xeasywork.tinyflow.common.flow.cache.MethodCache;
import com.xeasywork.tinyflow.common.util.spring.SpringUtils;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Data
@EqualsAndHashCode(callSuper = true)
public class InternalNode extends BaseNode {

    private String methodName;

    @Override
    protected Map<String, Object> execute(Chain chain) {
        Map<String, Object> result = new HashMap<>();
        Map<String, Object> argsMap = getParameters(chain);
        List<Parameter> outputDefs = getOutputDefs();
        if (outputDefs != null) {
            result.put(outputDefs.get(0).getName(), executeMethod(argsMap));
        }
        return result;
    }

    public Object executeMethod(Map<String, Object> params) {
        Method method = MethodCache.getMethodCache(methodName);
        if (method == null) {
            throw new IllegalArgumentException("Method not found: " + methodName);
        }
        // 获取方法参数类型
        Class<?>[] parameterTypes = method.getParameterTypes();
        // 准备参数数组
        Object[] args = new Object[parameterTypes.length];

        for (int i = 0; i < parameterTypes.length; i++) {
            String paramName = parameterTypes[i].getName(); // 注意：这里简化处理，实际应用中可能需要更复杂的映射逻辑
            args[i] = convertValue(params.get(paramName), parameterTypes[i]);
        }

        try {
            // 判断是否为静态方法
            if (Modifier.isStatic(method.getModifiers())) {
                return method.invoke(null, args);
            } else {
                // 对于非静态方法，我们需要获取相应的实例
                // 这里假设可以通过某种方式（例如服务定位器）获取到实例
                Object serviceInstance = getServiceInstance(method.getDeclaringClass());
                if (serviceInstance == null) {
                    throw new IllegalAccessException("Service instance not found for: " + method.getDeclaringClass().getName());
                }
                return method.invoke(serviceInstance, args);
            }
        } catch (IllegalAccessException | InvocationTargetException e) {
            throw new RuntimeException("Error invoking method: " + methodName, e);
        }
    }

    private Object convertValue(Object value, Class<?> toType) {
        if (value == null || toType.isInstance(value)) {
            return value;
        }

        // 处理基本类型和包装类
        if (toType.equals(Integer.class) || toType.equals(int.class)) {
            return Integer.parseInt(value.toString());
        } else if (toType.equals(Double.class) || toType.equals(double.class)) {
            return Double.parseDouble(value.toString());
        } else if (toType.equals(Float.class) || toType.equals(float.class)) {
            return Float.parseFloat(value.toString());
        } else if (toType.equals(Long.class) || toType.equals(long.class)) {
            return Long.parseLong(value.toString());
        } else if (toType.equals(Boolean.class) || toType.equals(boolean.class)) {
            return Boolean.parseBoolean(value.toString());
        } else if (toType.equals(Short.class) || toType.equals(short.class)) {
            return Short.parseShort(value.toString());
        } else if (toType.equals(Byte.class) || toType.equals(byte.class)) {
            return Byte.parseByte(value.toString());
        }
        // 可以添加更多的类型转换逻辑

        throw new IllegalArgumentException("Unsupported type conversion: " + value.getClass() + " to " + toType);
    }

    private Object getServiceInstance(Class<?> clazz) {
        if (clazz.isInterface() || Modifier.isAbstract(clazz.getModifiers())) {
            // 如果是接口或抽象类，则尝试通过Spring上下文获取其实现类的实例
            return SpringUtils.getBean(clazz);
        } else {
            try {
                // 尝试通过无参构造器创建实例
                return clazz.getDeclaredConstructor().newInstance();
            } catch (InstantiationException | IllegalAccessException | NoSuchMethodException | InvocationTargetException e) {
                throw new RuntimeException(e);
            }
        }
    }

}

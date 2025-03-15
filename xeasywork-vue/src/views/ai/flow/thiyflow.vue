<script setup name="TinyFlow">
import { Tinyflow } from '@tinyflow-ai/vue';
import '@tinyflow-ai/vue/dist/index.css';
import { ref } from 'vue';
import {getFlow, goRunFlow, updateFlow} from "@/api/ai/flow.js";
import { allListApiKey } from "@/api/ai/console/key.js";

const route = useRoute()
const tinyflowRef = ref(null)
const showPreview = ref(false)
const provider = ref({ llm: () => [], knowledge: () => [] }) // 初始化默认值
const initialData = ref(null)
const params = ref([{ key: '', value: '' }]) // 参数列表
const runResult = ref(null)
const loading = ref(false)
const error = ref(null)

// 添加参数项
const addParam = () => {
  params.value.push({ key: '', value: '' })
}

// 删除参数项
const removeParam = (index) => {
  if (params.value.length > 1) {
    params.value.splice(index, 1)
  }
}

// 并行请求数据
const loadData = async () => {
  try {
    const [apiKeys, flowData] = await Promise.all([
      allListApiKey(),
      getFlow(route.params.id)
    ])

    // 更新 provider
    provider.value = {
      llm: () => apiKeys.data.map(({ id, name }) => ({
        value: id,
        label: name
      })),
      knowledge: () => []
    }

    // 更新流程图数据
    initialData.value = JSON.parse(flowData.data.graph)
  } catch (error) {
    console.error('数据加载失败:', error)
  }
}

// 响应式加载数据
watchEffect(() => {
  if (route.params.id) {
    loadData()
  }
})

const togglePreview = () => {
  showPreview.value = !showPreview.value;
};

const save = () => {
  const val = tinyflowRef.value.getData()
  const data = {
    graph: JSON.stringify(val),
    id: route.params.id
  }
  updateFlow(data).then(response => {
    proxy.$modal.msgSuccess("修改成功");
  });
}

const goRun = async () => {
  try {
    const val = tinyflowRef.value.getData()
    loading.value = true
    error.value = null
    runResult.value = null
    /// 查找start节点
    const startNode = val.nodes.find(node => node.type === 'startNode')
    if (!startNode) {
      throw new Error('流程缺少起始节点')
    }

    debugger
    // 获取参数定义
    const parameters = startNode.data?.parameters || []
    const paramDefinitions = {}
    parameters.forEach(param => {
      paramDefinitions[param.name] = param.dataType
    })

    // 参数类型转换
    const convertedParams = {}
    for (const { key, value } of params.value) {
      const paramKey = key.trim()
      if (!paramKey) continue

      let dataType = paramDefinitions[paramKey]
      if (!dataType) {
        dataType = 'String'
      }

      try {
        convertedParams[paramKey] = convertParamValue(value, dataType)
      } catch (e) {
        throw new Error(`参数 ${paramKey} 转换失败: ${e.message}`)
      }
    }

    const data = {
      graph: JSON.stringify(val),
      param: convertedParams
    }

    const response = await goRunFlow(data)
    runResult.value = response.data  // 根据实际API响应结构调整
  } catch (err) {
    error.value = err.response?.data?.message || '运行失败，请检查参数和网络连接'
  } finally {
    loading.value = false
  }
}

// 类型转换函数
const convertParamValue = (value, dataType) => {
  if (value === '') return null // 空值处理

  switch(dataType) {
    case 'String':
      return String(value)
    case 'Number':
      const num = Number(value)
      if (isNaN(num)) throw new Error('非数字格式')
      return num
    case 'Boolean':
      if (value.toLowerCase() === 'true') return true
      if (value.toLowerCase() === 'false') return false
      throw new Error('必须为 true/false')
    case 'Object':
    case 'Array':
      try {
        return JSON.parse(value)
      } catch (e) {
        throw new Error(`JSON格式错误: ${e.message}`)
      }
    default:
      throw new Error(`不支持的类型: ${dataType}`)
  }
}
</script>

<template>
  <div style="width: 100%; height: calc(100vh - 85px)">
    <Tinyflow
        ref="tinyflowRef"
        :className="'custom-class'"
        :style="{ width: '100%', height: '100%' }"
        v-if="initialData" :data="initialData"
        :provider="provider"
    />
    <!-- 预览窗口 -->
    <div v-if="showPreview" class="preview-window">
      <h3>运行参数配置</h3>
      <div v-for="(param, index) in params" :key="index" class="param-item">
        <input
            v-model="param.key"
            placeholder="参数名"
            class="param-input"
        >
        <input
            v-model="param.value"
            placeholder="参数值"
            class="param-input"
        >
        <button
            @click="removeParam(index)"
            class="remove-btn"
            :disabled="params.length === 1"
        >
          删除
        </button>
      </div>
      <button @click="addParam" class="add-btn">+ 添加参数</button>
      <!-- 运行结果展示 -->
      <div class="result-area">
        <h4>运行结果</h4>
        <div v-if="loading" class="loading">执行中...</div>
        <div v-else-if="error" class="error">{{ error }}</div>
        <pre v-else-if="runResult" class="result-content">{{ JSON.stringify(runResult, null, 2) }}</pre>
        <div v-else class="empty">点击运行查看结果</div>
      </div>
      <button @click="goRun" class="run-btn">运行流程</button>
    </div>
    <div class="preview">
      <button @click="save" class="preview-button" >
        保存
      </button>
        <button @click="togglePreview" class="preview-button" >
          {{ showPreview ? '关闭预览' : '流程预览' }}
        </button>
    </div>
  </div>

</template>

<style>
.preview{
  position: absolute;
  right: 20px;
  top: 20px;
  z-index: 1000;
}
.preview-button {
  padding: 8px 16px;
  background: #409eff;
  color: white;
  border: none;
  margin-left: 20px;
  border-radius: 4px;
  cursor: pointer;
  box-shadow: 0 2px 4px rgba(0,0,0,0.1);
}

.preview-button:hover {
  background: #66b1ff;
}
.preview-window {
  position: fixed;
  right: 0;
  top: 60px;
  padding: 100px 20px;
  width: 400px;
  height: calc(100vh - 80px);
  background: white;
  box-shadow: -2px 0 8px rgba(0,0,0,0.1);
  overflow-y: auto;
  z-index: 999;
}

.preview-window h3 {
  margin-bottom: 20px;
  color: #333;
}

.param-item {
  display: flex;
  gap: 10px;
  margin-bottom: 10px;
}

.param-input {
  flex: 1;
  padding: 8px;
  width: 100px;
  border: 1px solid #ddd;
  border-radius: 4px;
}

.add-btn {
  width: 100%;
  padding: 8px;
  background: #f0f2f5;
  border: 1px dashed #ccc;
  border-radius: 4px;
  cursor: pointer;
  margin: 10px 0;
}

.add-btn:hover {
  border-color: #409eff;
  color: #409eff;
}

.run-btn {
  width: 100%;
  padding: 12px;
  background: #67c23a;
  color: white;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

.run-btn:hover {
  background: #85ce61;
}

.remove-btn {
  padding: 0 12px;
  background: #ff4d4f;
  color: white;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

.remove-btn:disabled {
  background: #ccc;
  cursor: not-allowed;
}
/* 新增样式 */
.result-area {
  margin-top: 20px;
  padding: 15px;
  background: #f8f9fa;
  border-radius: 6px;
  border: 1px solid #e9ecef;
}

.result-area h4 {
  margin: 0 0 10px 0;
  color: #606266;
}

.result-content {
  background: white;
  padding: 12px;
  border-radius: 4px;
  max-height: 300px;
  overflow: auto;
  font-family: Monaco, Consolas, monospace;
  font-size: 14px;
  line-height: 1.5;
  white-space: pre-wrap;
}

.loading {
  color: #409eff;
  padding: 10px;
  text-align: center;
}

.error {
  color: #ff4d4f;
  padding: 10px;
  background: #fff2f0;
  border-radius: 4px;
}

.empty {
  color: #909399;
  padding: 10px;
  text-align: center;
}
</style>
<template>
  <div class="app-container chat-container">
    <!-- 左侧边栏 -->
    <div class="chat-sidebar">
      <div class="sidebar-header">
        <div class="logo-area">
          <svg-icon class="logo-icon" icon-class="chat-dot-square"/>
          <span class="logo-text">Ai Chat</span>
        </div>
        <el-button
            type="primary"
            class="new-chat-btn"
            @click="startNewChat"
        >
          <svg-icon class="logo-icon" icon-class="edit-outline"/>
          <span>新建对话</span>
        </el-button>
      </div>

      <div class="chat-history-container">
        <div class="history-header">
          <span class="history-title">历史对话</span>
          <el-dropdown trigger="click" size="small">
            <el-button type="text">
              <svg-icon class="logo-icon" icon-class="more"/>
            </el-button>
            <template #dropdown>
              <el-dropdown-menu>
                <el-dropdown-item>
                  <el-button type="text" @click="cleanChatHistory">
                    清空历史
                  </el-button>
                </el-dropdown-item>
                <el-dropdown-item>
                  <el-button type="text" @click="exportChatHistory">
                    导出记录
                  </el-button>
                </el-dropdown-item>
              </el-dropdown-menu>
            </template>
          </el-dropdown>
        </div>
        <div class="chat-history">
          <div
              v-for="(chat, index) in chatHistory"
              :key="index"
              class="chat-history-item"
              :class="{ 'active': currentChatIndex === index }"
              @click="switchChat(index)"
          >
            <svg-icon class="chat-icon" icon-class="chat-round"/>
            <div class="chat-info">
              <div class="title">{{ chat.title }}</div>
              <div class="time">{{ parseTime(chat.createTime) }}</div>
            </div>
            <el-dropdown trigger="hover" class="chat-actions">
              <el-button type="text" class="action-btn">
                <svg-icon icon-class="more"/>
              </el-button>
              <template #dropdown>
                <el-dropdown-menu>
                  <el-dropdown-item>
                    <el-button type="text" @click="renameChat(index)">
                      重命名
                    </el-button>
                  </el-dropdown-item>
                  <el-dropdown-item>
                    <el-button type="text" @click="deleteChat(index)">
                      删除
                    </el-button>
                  </el-dropdown-item>
                </el-dropdown-menu>
              </template>
            </el-dropdown>
          </div>
        </div>
      </div>
    </div>

    <!-- 主聊天区域 -->
    <div class="chat-main">
      <div class="chat-container-wrapper">
        <!-- 消息列表 -->
        <div class="chat-messages" ref="scrollArea">
          <div
              v-for="(message, index) in messages"
              :key="index"
              :class="['message', message.role === 'user' ? 'message-user' : 'message-ai']"
          >
            <div class="message-avatar">
              <img
                  :src="getAvatar(message.role, selectedModel)"
                  :alt="message.role === 'user' ? '用户' : 'AI'"
              />
            </div>
            <div class="message-content">
              <div class="message-text">{{ message.content }}</div>
              <div class="message-time">{{ parseTime(message.createTime) }}</div>
            </div>
          </div>
        </div>

        <!-- 输入区域 -->
        <div class="chat-input-wrapper">
          <div class="chat-input">
            <div class="input-wrapper">
              <el-input
                  v-model="inputMessage"
                  type="textarea"
                  :rows="3"
                  placeholder="请输入您的问题..."
                  resize="none"
                  @keyup.enter="sendMessage"
              />
              <el-button
                  type="primary"
                  @click="sendMessage"
                  :loading="isLoading"
              >
                发送
                <svg-icon icon-class="s-promotion"/>
              </el-button>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- 右侧设置面板 -->
    <div class="chat-settings">
      <el-card>
        <template #header>
          <div>对话设置</div>
        </template>

        <el-form>
          <el-form-item label="AI模型">
            <el-select v-model="selectedModel" @change="switchModel">
              <el-option
                  v-for="data in modelList"
                  :key="data.id"
                  :label="data.name"
                  :value="data.name"
              />
            </el-select>
          </el-form-item>

          <el-form-item label="对话模式">
            <el-radio-group v-model="chatMode">
              <el-radio label="base">基础</el-radio>
              <el-radio label="rag">知识库</el-radio>
            </el-radio-group>
          </el-form-item>
        </el-form>
      </el-card>
    </div>

    <el-dialog v-model="open" title="重命名" width="500px" append-to-body>
      <el-form ref="formRef" :model="form" :rules="rules">
        <el-form-item prop="title">
          <el-input v-model="form.title" placeholder="请输入名称" clearable />
        </el-form-item>
      </el-form>
      <template #footer>
        <div class="dialog-footer">
          <el-button type="primary" @click="confirmRenameChat">确 定</el-button>
          <el-button @click="open = false">取 消</el-button>
        </div>
      </template>
    </el-dialog>
  </div>
</template>

<script setup>
import { ref, reactive, onMounted, onBeforeUnmount, nextTick } from 'vue'
import { ElMessage, ElMessageBox } from 'element-plus'
import {
  listSession,
  addSession,
  delSession,
  delAllSession,
  updateSession
} from '@/api/ai/chat/chatSession'
import { listDetail } from '@/api/ai/chat/chatSessionDetail'
import { streamChat } from '@/api/ai/chat/chatBox'
import { getToken } from '@/utils/auth'
import userAvatar from '@/assets/images/profile.jpg'
import qwqAI from '@/assets/images/ai/qwq-ai.png'
import deepseekAI from '@/assets/images/ai/deepseek-ai.png'
import {allListApiKey, getApiKey, listApiKey} from "@/api/ai/console/key.js";

let model;
// 2. 创建获取头像的方法
const getAvatar = (role) => {
  if (role === 'user') return userAvatar
  switch (model.platform) {
    case 'TongYi':
      return qwqAI;
    case 'DeepSeek':
      return deepseekAI;
    default:
      return deepseekAI;
  }
}
// 响应式数据
const chatHistory = ref([])
const messages = ref([])
const modelList  = ref(null)
let inputMessage = ref('')
const selectedModel = ref(null)
const chatMode = ref('base')
let currentChatIndex = ref(0)
const isLoading = ref(false)
const open = ref(false)
const scrollArea = ref(null)
const formRef = ref(null)

const form = reactive({
  id: null,
  title: ''
})

const rules = reactive({
  title: [{ required: true, message: '名称不能为空', trigger: 'blur' }]
})

let eventSource = null

// 生命周期
onMounted(async () => {
  await listChatHistory()
  modelList.value = (await allListApiKey()).data
  if (modelList.value.length > 0) {
    selectedModel.value = modelList.value[0].name
  }
  initialSession()
})

onBeforeUnmount(() => {
  if (eventSource) eventSource.close()
})

// 方法
const parseTime = (timestamp) => {
  const date = new Date(timestamp)
  return `${date.getHours().toString().padStart(2, '0')}:${date.getMinutes().toString().padStart(2, '0')}`
}

const listChatHistory = async () => {
  try {
    const response = await listSession()
    chatHistory.value = response.rows
  } catch (error) {
    ElMessage.error('获取历史记录失败')
  }
}

const initialSession = () => {
  if (!chatHistory.value.length) {
    messages.value = []
    return
  }
  switchChat(0)
}

const startNewChat = () => {
  messages.value = []
  currentChatIndex.value = -1
}

const switchChat = async (index) => {
  currentChatIndex.value = index
  try {
    const session = chatHistory.value[currentChatIndex.value]
    model = session;
    const response = await listDetail({ sessionId: session.id })
    messages.value = response.rows
  } catch (error) {
    ElMessage.error('加载聊天记录失败')
  }
}

const sendMessage = async () => {
  if (!inputMessage.value.trim()  || isLoading.value)  return;
  isLoading.value = true;
  // 新会话
  if (messages.value.length === 0) {
    // 新增会话
    await addSession({title: inputMessage.value, modelId: model.modelId});
    // 加载所有会话
    await listChatHistory();
    // 加载最新会话消息
    currentChatIndex.value = 0;
  }
  if (eventSource) {
    eventSource.close();
    eventSource = null;
  }
  // 新增会话详细
  let userMsg = {sessionId: chatHistory.value[currentChatIndex.value].id, role: 'user', content: inputMessage.value, createTime: Date.now()};
  messages.value.push(userMsg);
  // 清空输入框
  inputMessage.value = '';
  try {
    // 创建 SSE 连接（携带 Token）
    eventSource  = await streamChat(
        chatHistory.value[currentChatIndex.value].id,
        model.modelId,
        messages.value[messages.value.length - 1].content,
        getToken() // 注入认证令牌
    );
    // 初始化助手消息
    let assistantMsg = {sessionId: chatHistory.value[currentChatIndex.value].id, role: 'assistant', content: '', createTime: Date.now()};
    messages.value.push(assistantMsg);
    // 流式数据处理器
    eventSource.onmessage = async (event) => {
      if (event.data) {
        if (event.data !== 'end') {
          assistantMsg.content += event.data;
          // 强制 DOM 更新（关键！）
          messages.value = [...messages.value]
          await nextTick(() => scrollToBottom());
        } else {
          isLoading.value  = false;
          eventSource.close();
        }
      }
    };
    // 错误处理
    eventSource.onerror = async (e) => {
      isLoading.value  = false;
      eventSource.close();
    };
  } catch (error) {
    console.error('API  Error:', error);
    isLoading.value  = false;
  }
}

const cleanChatHistory = () => {
  ElMessageBox.confirm('确定要清空历史吗？', '警告', {
    confirmButtonText: '确定',
    cancelButtonText: '取消',
    type: 'warning'
  }).then(() => {
    delAllSession().then(() => {
      chatHistory.value = []
      messages.value = []
      ElMessage.success('清空成功')
    })
  }).catch(() => {})
}

const exportChatHistory = () => {
  ElMessage.info('导出功能开发中')
}

const renameChat = (index) => {
  form.id = chatHistory.value[index].id
  form.title = chatHistory.value[index].title
  open.value = true
}

const confirmRenameChat = async () => {
  try {
    await formRef.value.validate()
    await updateSession(form)
    await listChatHistory()
    open.value = false
    ElMessage.success('重命名成功')
  } catch (error) {
    // 验证失败不处理
  }
}

const deleteChat = (index) => {
  const chat = chatHistory.value[index]
  ElMessageBox.confirm(`确定删除对话 "${chat.title}" 吗？`, '警告', {
    confirmButtonText: '删除',
    cancelButtonText: '取消',
    type: 'warning'
  }).then(() => {
    delSession(chat.id).then(() => {
      chatHistory.value.splice(index, 1)
      if (currentChatIndex.value === index) {
        messages.value = []
      }
      ElMessage.success('删除成功')
    })
  }).catch(() => {})
}

const scrollToBottom = () => {
  if (scrollArea.value) {
    scrollArea.value.scrollTop = scrollArea.value.scrollHeight
  }
}

</script>

<style scoped lang="scss">
.chat-container {
  display: flex;
  height: 90vh;
  background-color: #f5f7fa;
}

.chat-sidebar {
  width: 280px;
  display: flex;
  border-radius: 12px;
  flex-direction: column;
  background: #fff;
  border-right: 1px solid #e6e6e6;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.05);

  .sidebar-header {
    padding: 16px;
    border-bottom: 1px solid #eee;

    .logo-area {
      display: flex;
      align-items: center;
      margin-bottom: 16px;

      .logo-icon {
        color: #1890ff;
        margin-left: 40px;
        margin-right: 20px;
        font-size: 25px;
      }

      .logo-text {
        font-size: 20px;
        font-weight: 600;
        color: #333;
      }
    }

    .new-chat-btn {
      width: 100%;
      display: flex;
      align-items: center;
      justify-content: center;
      gap: 8px;
      height: 40px;
      border-radius: 8px;
      transition: all 0.3s;

      &:hover {
        transform: translateY(-1px);
        box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
      }
    }
  }

  .chat-history-container {
    flex: 1;
    overflow: hidden;
    padding: 16px 8px;

    .history-header {
      display: flex;
      align-items: center;
      justify-content: space-between;
      padding: 0 8px;
      margin-bottom: 12px;

      .history-title {
        font-size: 13px;
        color: #666;
        font-weight: 500;
      }
    }
  }
  .chat-history {
    height: 95%;
    overflow-y: auto;
    &-item {
      display: flex;
      align-items: center;
      padding: 10px 12px;
      margin: 2px 0;
      border-radius: 8px;
      cursor: pointer;
      transition: all 0.2s;
      position: relative;

      &:hover {
        background: #f5f7fa;

        .chat-actions {
          opacity: 1;
        }
      }

      &.active {
        background: #e6f4ff;

        .title {
          color: #1890ff;
        }
      }

      .chat-icon {
        font-size: 18px;
        color: #666;
        margin-right: 15px;
      }

      .chat-info {
        flex: 1;
        min-width: 0;

        .title {
          text-align: left;
          font-size: 14px;
          color: #333;
          margin-bottom: 5px;
          white-space: nowrap;
          overflow: hidden;
          text-overflow: ellipsis;
        }

        .time {
          font-size: 12px;
          color: #999;
        }
      }

      .chat-actions {
        opacity: 0;
        transition: opacity 0.2s;

        .action-btn {
          padding: 2px;
        }
      }
    }
  }
}

.chat-main {
  flex: 1;
  margin-left: 15px;
  margin-right: 15px;
  border-radius: 12px;
  background: #fff;
  box-shadow: 0 2px 12px rgba(0, 0, 0, 0.08);
  overflow: hidden;

  .chat-container-wrapper {
    display: flex;
    flex-direction: column;
    height: 100%;
  }
}

.chat-messages {
  flex: 1;
  padding: 20px;
  overflow-y: auto;

  .message {
    display: flex;
    margin-bottom: 20px;

    &-user {
      flex-direction: row-reverse;

      .message-content {
        margin-right: 12px;

        .message-text {
          background: #e3f2fd;
          border-radius: 12px 2px 12px 12px;
        }
      }
    }

    &-ai .message-content {
      margin-left: 12px;

      .message-text {
        background: #f5f5f5;
        border-radius: 2px 12px 12px 12px;
      }
    }

    &-avatar {
      width: 40px;
      height: 40px;
      border-radius: 50%;
      overflow: hidden;

      img {
        width: 100%;
        height: 100%;
        object-fit: cover;
      }
    }

    &-content {
      max-width: 70%;
    }

    &-text {
      padding: 12px 16px;
      font-size: 14px;
      line-height: 1.5;
    }

    &-time {
      margin-top: 4px;
      font-size: 12px;
      color: #999;
    }
  }
}

.chat-input-wrapper {
  flex-shrink: 0;
  background: #fff;
  border-top: 1px solid #eee;

  .chat-input {
    padding: 20px;

    .input-wrapper {
      display: flex;
      gap: 10px;

      .el-input {
        flex: 1;
      }

      .el-button {
        align-self: flex-end;
      }
    }
  }
}

.chat-settings {
  width: 300px;
  .el-card {
    height: 100%;
  }
}
</style>
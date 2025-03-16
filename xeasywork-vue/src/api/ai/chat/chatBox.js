import {EventSourcePolyfill} from "event-source-polyfill";

export function streamChat(sessionId, modelId, text, token) {
  return new Promise((resolve, reject) => {
    const eventSource = new EventSourcePolyfill(
        `${import.meta.env.VITE_APP_BASE_API}/ai/chat/streamChat?sessionId=${encodeURIComponent(sessionId)}&modelId=${encodeURIComponent(modelId)}&text=${encodeURIComponent(text)}`,
        {
          headers: {
            Authorization: 'Bearer ' + token,
            Accept: 'text/event-stream'
          },
        })
    eventSource.onopen  = () => {
      resolve(eventSource)
    }

    eventSource.onerror  = (error) => {
      if (error.status  === 401) {
        reject(new Error('认证失败，请重新登录'))
      } else {
        reject(error)
      }
      eventSource.close()
    }
  })
}

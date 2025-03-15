import request from '@/utils/request'

// 查询参数列表
export function listFlow(query) {
  return request({
    url: '/ai/flow/list',
    method: 'get',
    params: query
  })
}

// 查询参数详细
export function getFlow(configId) {
  return request({
    url: '/ai/flow/' + configId,
    method: 'get'
  })
}

// 新增参数配置
export function addFlow(data) {
  return request({
    url: '/ai/flow',
    method: 'post',
    data: data
  })
}

// 修改参数配置
export function updateFlow(data) {
  return request({
    url: '/ai/flow',
    method: 'put',
    data: data
  })
}

// 删除参数配置
export function delFlow(configId) {
  return request({
    url: '/ai/flow/' + configId,
    method: 'delete'
  })
}

// 新增参数配置
export function goRunFlow(data) {
  return request({
    url: '/ai/flow/goRun',
    method: 'post',
    data: data
  })
}
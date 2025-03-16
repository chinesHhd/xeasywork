import request from '@/utils/request'

// 查询参数列表
export function listApiKey(query) {
    return request({
        url: '/ai/console/key/list',
        method: 'get',
        params: query
    })
}

// 查询参数列表
export function allListApiKey(query) {
    return request({
        url: '/ai/console/key/allList',
        method: 'get',
        params: query
    })
}

// 查询参数详细
export function getApiKey(id) {
    return request({
        url: '/ai/console/key/' + id,
        method: 'get'
    })
}

// 新增参数配置
export function addApiKey(data) {
    return request({
        url: '/ai/console/key',
        method: 'post',
        data: data
    })
}

// 修改参数配置
export function updateApiKey(data) {
    return request({
        url: '/ai/console/key',
        method: 'put',
        data: data
    })
}

// 删除参数配置
export function delApiKey(id) {
    return request({
        url: '/ai/console/key/' + id,
        method: 'delete'
    })
}

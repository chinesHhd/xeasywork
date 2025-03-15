<template>
   <div class="app-container">
      <el-form :model="queryParams" ref="queryRef" :inline="true" v-show="showSearch" label-width="68px">
         <el-form-item label="名称" prop="name">
            <el-input
               v-model="queryParams.name"
               placeholder="请输入名称"
               clearable
               style="width: 240px"
               @keyup.enter="handleQuery"
            />
         </el-form-item>
        <el-form-item label="所属平台" prop="platform">
          <el-select v-model="queryParams.platform" placeholder="请选择" clearable style="width: 240px">
            <el-option v-for="dict in ai_ak_platform" :key="dict.value" :label="dict.label" :value="dict.value" />
          </el-select>
        </el-form-item>
         <el-form-item>
            <el-button type="primary" icon="Search" @click="handleQuery">搜索</el-button>
            <el-button icon="Refresh" @click="resetQuery">重置</el-button>
         </el-form-item>
      </el-form>

      <el-row :gutter="10" class="mb8">
         <el-col :span="1.5">
            <el-button
               type="primary"
               plain
               icon="Plus"
               @click="handleAdd"
               v-hasPermi="['ai:console:key:add']"
            >新增</el-button>
         </el-col>
         <el-col :span="1.5">
            <el-button
               type="danger"
               plain
               icon="Delete"
               :disabled="multiple"
               @click="handleDelete"
               v-hasPermi="['ai:console:key:remove']"
            >删除</el-button>
         </el-col>
         <right-toolbar v-model:showSearch="showSearch" @queryTable="getList"></right-toolbar>
      </el-row>

      <el-table v-loading="loading" :data="configList" @selection-change="handleSelectionChange">
         <el-table-column type="selection" width="55" align="center" />
         <el-table-column label="AK主键" align="center" prop="id" />
         <el-table-column label="名称" align="center" prop="name" :show-overflow-tooltip="true" />
        <el-table-column label="所属平台" align="center" prop="platform">
          <template #default="scope">
            <dict-tag :options="ai_ak_platform" :value="scope.row.platform" />
          </template>
        </el-table-column>
         <el-table-column label="密钥" align="center" prop="apiKey" :show-overflow-tooltip="true" />
         <el-table-column label="自定义地址" align="center" prop="url" :show-overflow-tooltip="true" />
         <el-table-column label="创建时间" align="center" prop="createTime" width="180">
            <template #default="scope">
               <span>{{ parseTime(scope.row.createTime) }}</span>
            </template>
         </el-table-column>
         <el-table-column label="操作" align="center" width="150" class-name="small-padding fixed-width">
            <template #default="scope">
               <el-button link type="primary" icon="Edit" @click="handleUpdate(scope.row)" v-hasPermi="['ai:console:key:edit']" >修改</el-button>
               <el-button link type="primary" icon="Delete" @click="handleDelete(scope.row)" v-hasPermi="['ai:console:key:remove']">删除</el-button>
            </template>
         </el-table-column>
      </el-table>

      <pagination
         v-show="total > 0"
         :total="total"
         v-model:page="queryParams.pageNum"
         v-model:limit="queryParams.pageSize"
         @pagination="getList"
      />

      <!-- 添加或修改密钥配置对话框 -->
      <el-dialog :title="title" v-model="open" width="500px" append-to-body>
         <el-form ref="configRef" :model="form" :rules="rules" label-width="100px">
            <el-form-item label="名称" prop="name">
               <el-input v-model="form.name" placeholder="请输入名称" />
            </el-form-item>
           <el-form-item label="所属平台" prop="platform">
             <el-select v-model="form.platform" placeholder="所属平台" clearable style="width: 240px">
               <el-option
                   v-for="dict in ai_ak_platform"
                   :key="dict.value"
                   :label="dict.label"
                   :value="dict.value"
               />
             </el-select>
           </el-form-item>
            <el-form-item label="密钥" prop="apiKey">
              <el-input v-model="form.apiKey" placeholder="请输入密钥" />
            </el-form-item>
            <el-form-item label="自定义地址" prop="url">
              <el-input v-model="form.url" placeholder="请输入URL" />
            </el-form-item>
         </el-form>
         <template #footer>
            <div class="dialog-footer">
               <el-button type="primary" @click="submitForm">确 定</el-button>
               <el-button @click="cancel">取 消</el-button>
            </div>
         </template>
      </el-dialog>
   </div>
</template>

<script setup name="ApiKey">
import { listApiKey, getApiKey, delApiKey, addApiKey, updateApiKey } from "@/api/ai/console/key.js";

const { proxy } = getCurrentInstance();
const { ai_ak_platform } = proxy.useDict("ai_ak_platform");

const configList = ref([]);
const open = ref(false);
const loading = ref(true);
const showSearch = ref(true);
const ids = ref([]);
const single = ref(true);
const multiple = ref(true);
const total = ref(0);
const title = ref("");
const dateRange = ref([]);

const data = reactive({
  form: {},
  queryParams: {
    pageNum: 1,
    pageSize: 10,
    name: undefined,
    platform: undefined
  },
  rules: {
    name: [{ required: true, message: "名称不能为空", trigger: "blur" }],
    apiKey: [{ required: true, message: "密钥不能为空", trigger: "blur" }],
    platform: [{ required: true, message: "所属平台不能为空", trigger: "blur" }],
  }
});

const { queryParams, form, rules } = toRefs(data);

/** 查询密钥列表 */
function getList() {
  loading.value = true;
  listApiKey(proxy.addDateRange(queryParams.value, dateRange.value)).then(response => {
    configList.value = response.rows;
    total.value = response.total;
    loading.value = false;
  });
}

/** 取消按钮 */
function cancel() {
  open.value = false;
  reset();
}

/** 表单重置 */
function reset() {
  form.value = {
    id: undefined,
    name: undefined,
    apiKey: undefined,
    platform: undefined,
    url: undefined
  };
  proxy.resetForm("configRef");
}

/** 搜索按钮操作 */
function handleQuery() {
  queryParams.value.pageNum = 1;
  getList();
}

/** 重置按钮操作 */
function resetQuery() {
  dateRange.value = [];
  proxy.resetForm("queryRef");
  handleQuery();
}

/** 多选框选中数据 */
function handleSelectionChange(selection) {
  ids.value = selection.map(item => item.id);
  single.value = selection.length !== 1;
  multiple.value = !selection.length;
}

/** 新增按钮操作 */
function handleAdd() {
  reset();
  open.value = true;
  title.value = "添加密钥";
}

/** 修改按钮操作 */
function handleUpdate(row) {
  reset();
  const id = row.id || ids.value;
  getApiKey(id).then(response => {
    form.value = response.data;
    open.value = true;
    title.value = "修改密钥";
  });
}

/** 提交按钮 */
function submitForm() {
  proxy.$refs["configRef"].validate(valid => {
    if (valid) {
      if (form.value.id !== undefined) {
        updateApiKey(form.value).then(response => {
          proxy.$modal.msgSuccess("修改成功");
          open.value = false;
          getList();
        });
      } else {
        addApiKey(form.value).then(response => {
          proxy.$modal.msgSuccess("新增成功");
          open.value = false;
          getList();
        });
      }
    }
  });
}

/** 删除按钮操作 */
function handleDelete(row) {
  console.log(row)
  const tfIds = row.id || ids.value;
  proxy.$modal.confirm('是否确认删除密钥编号为"' + tfIds + '"的数据项？').then(function () {
    return delApiKey(tfIds);
  }).then(() => {
    getList();
    proxy.$modal.msgSuccess("删除成功");
  }).catch(() => {});
}

getList();
</script>

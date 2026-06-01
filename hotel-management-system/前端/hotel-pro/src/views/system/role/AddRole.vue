<template>
  <sys-dialog
    :title="dialog.title"
    :width="dialog.width"
    :height="dialog.height"
    :visible="dialog.visible"
    @onClose="onClose"
    @onConfirm="commit"
  >
    <template v-slot:content>
      <el-form
        :model="addModel"
        ref="addFormRef"
        :rules="rules"
        label-width="80px"
        size="default"
      >
        <el-row>
          <el-col :span="12" :offset="0">
            <el-form-item prop="roleName" label="角色名称">
              <el-input v-model="addModel.roleName"></el-input>
            </el-form-item>
          </el-col>
          <el-col :span="12" :offset="0">
            <el-form-item prop="remark" label="备注">
              <el-input v-model="addModel.remark"></el-input>
            </el-form-item>
          </el-col>
        </el-row>
      </el-form>
    </template>
  </sys-dialog>
</template>

<script setup lang="ts">
import { ElMessage, FormInstance } from "element-plus";
import { AddRoleModel } from "@/api/role/RoleModel";
import SysDialog from "@/components/SysDialog.vue";
import useDialog from "@/hooks/useDialog";
import { nextTick, reactive, ref } from "vue";
import { addApi,editApi } from "@/api/role";
import { EditType, Title } from "@/type/BaseEnum";
import useInstance from "@/hooks/useInstance";
const { global } = useInstance();
//表单ref属性
const addFormRef = ref<FormInstance>();
//弹框属性
const { dialog, onClose, onShow } = useDialog();
//弹框显示
const show = (type: string, row?: AddRoleModel) => {
  dialog.height = 150;
  //设置弹框的标题
  type == EditType.ADD
    ? (dialog.title = Title.ADD)
    : (dialog.title = Title.EDIT);
  //如果是编辑，数据回显
  if (type == EditType.EDIT) {
    console.log(row);
    //把当前要编辑的数据复制到表单绑定的对象
    nextTick(() => {
      global.$objCoppy(row, addModel);
    });
  }
  onShow();
  //清空表单
  addFormRef.value?.resetFields();
  //设置是 编辑 1 还是新增 0
  addModel.type = type;
};
//暴露出去，给外部组件使用
defineExpose({
  show,
});
//表单绑定的数据
const addModel = reactive<AddRoleModel>({
  type: "",
  roleId: "",
  remark: "",
  roleName: "",
});
//表单验证规则
const rules = reactive({
  roleName: [
    {
      required: true,
      trigger: "change",
      message: "请填写角色名称",
    },
  ],
});
//注册事件
const emits = defineEmits(["refresh"]);
//表单提交
const commit = () => {
  //表单验证：1、表单需要有ref属性  2：表单要绑定rules 3:el-form-item需要添加prop属性
  addFormRef.value?.validate(async (valid) => {
    if (valid) {
      let res = null;
      if (addModel.type == EditType.ADD) {
        res = await addApi(addModel);
      }else{
        res = await editApi(addModel)
      }
      if (res && res.code == 200) {
        //信息提示
        ElMessage.success(res.msg);
        //刷新列表
        emits("refresh");
        onClose();
      }
    }
  });
};
</script>

<style scoped></style>

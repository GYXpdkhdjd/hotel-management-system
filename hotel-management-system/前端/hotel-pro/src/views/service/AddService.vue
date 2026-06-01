<template>
  <SysDialog
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
        :inline="false"
        size="normal"
      >
        <el-form-item prop="name" label="服务名称">
          <el-input v-model="addModel.name"></el-input>
        </el-form-item>
        <el-form-item prop="orderNum" label="序号">
          <el-input v-model="addModel.orderNum"></el-input>
        </el-form-item>
      </el-form>
    </template>
  </SysDialog>
</template>

<script setup lang="ts">
import { ServiceType } from "@/api/service/ServiceModel";
import SysDialog from "@/components/SysDialog.vue";
import useDialog from "@/hooks/useDialog";
import { ElMessage, FormInstance } from "element-plus";
import { nextTick, reactive, ref } from "vue";
import { addApi, editApi } from "@/api/service/index";
import { EditType, Title } from "@/type/BaseEnum";
//表单ref属性
const addFormRef = ref<FormInstance>();
//弹框属性
const { dialog, onClose, onConfirm, onShow } = useDialog();
//显示弹框
const show = (type: string, row?: ServiceType) => {
  //弹框属性
  dialog.height = 150;
  type == EditType.ADD
    ? (dialog.title = Title.ADD)
    : (dialog.title = Title.EDIT);
  onShow();
  //编辑数据的设置
  if (row && type == EditType.EDIT) {
    nextTick(() => {
      Object.assign(addModel, row);
    });
  }
  addModel.type = type;
  //清空表单
  addFormRef.value?.resetFields();
};
//暴露出去
defineExpose({
  show,
});
//表单数据对象
const addModel = reactive<ServiceType>({
  type: "",
  name: "",
  serviceId: "",
  orderNum: "",
});
//表单验证规则
const rules = reactive({
  name: [
    {
      required: true,
      trigger: "blur",
      message: "请填写服务名称",
    },
  ],
});
//注册事件
const emits = defineEmits(["onRefsh"]);
//表单提交
const commit = () => {
  addFormRef.value?.validate(async (valid) => {
    if (valid) {
      let res = null;
      if (addModel.type == EditType.ADD) {
        res = await addApi(addModel);
      } else {
        res = await editApi(addModel);
      }
      if (res && res.code == 200) {
        ElMessage.success(res.msg);
        emits("onRefsh");
        onClose();
      }
    }
  });
};
</script>

<style scoped></style>

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
        size="default"
      >
        <el-form-item prop="name" label="类型名称">
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
import SysDialog from "@/components/SysDialog.vue";
import useDialog from "@/hooks/useDialog";
import { nextTick, reactive, ref } from "vue";
import { TypeModel } from "@/api/type/TypeModel";
import { ElMessage, FormInstance } from "element-plus";
import { addApi,editApi } from "@/api/type/index";
import { EditType, Title } from "@/type/BaseEnum";
//表单ref属性
const addFormRef = ref<FormInstance>();
//弹框属性
const { dialog, onClose, onConfirm, onShow } = useDialog();
//弹框显示
const show = (type:string,row?:TypeModel) => {
  //弹框属性
  dialog.height = 150;
  type == EditType.ADD ? dialog.title = Title.ADD : dialog.title = Title.EDIT;
  onShow();
  //编辑数据回显
  if(row && EditType.EDIT == type){
    nextTick(()=>{
      Object.assign(addModel,row);
    })
  }
  addModel.type = type;
  addFormRef.value?.resetFields()
};
//暴露出去
defineExpose({
  show,
});
//表单数据
const addModel = reactive<TypeModel>({
  type: "",
  typeId: "",
  name: "",
  orderNum: "",
});
//表单验证规则
const rules = reactive({
  name: [
    {
      trigger: "blur",
      required: true,
      message: "请填写类型名称",
    },
  ],
});
//注册事件
const emits = defineEmits(['onFresh'])
//表单提交
const commit = () => {
  addFormRef.value?.validate(async (valid) => {
    if (valid) {
      let res = null;
      if(addModel.type == EditType.ADD){
        res = await addApi(addModel);
      }else{
        res = await editApi(addModel)
      }
      if (res && res.code == 200) {
        ElMessage.success(res.msg)
        emits('onFresh')
        onClose();
      }
    }
  });
};
</script>

<style scoped></style>

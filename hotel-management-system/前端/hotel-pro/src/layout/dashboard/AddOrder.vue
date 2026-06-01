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
        size="default"
      >
        <el-row>
          <el-col :span="12" :offset="0">
            <el-form-item prop="name" label="姓名">
              <el-input v-model="addModel.name"></el-input>
            </el-form-item>
          </el-col>
          <el-col :span="12" :offset="0">
            <el-form-item prop="sex" label="性别">
              <el-radio-group v-model="addModel.sex">
                <el-radio :label="'0'">男</el-radio>
                <el-radio :label="'1'">女</el-radio>
              </el-radio-group>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12" :offset="0">
            <el-form-item prop="phone" label="电话">
              <el-input v-model="addModel.phone"></el-input>
            </el-form-item>
          </el-col>
          <el-col :span="12" :offset="0">
            <el-form-item prop="cardType" label="证件类型">
              <el-input v-model="addModel.cardType"></el-input>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12" :offset="0">
            <el-form-item prop="cardNum" label="证件号码">
              <el-input v-model="addModel.cardNum"></el-input>
            </el-form-item>
          </el-col>
        </el-row>
      </el-form>
    </template>
  </SysDialog>
</template>

<script setup lang="ts">
import { addOrderApi, bookOrderApi } from "@/api/home/index";
import SysDialog from "@/components/SysDialog.vue";
import useDialog from "@/hooks/useDialog";
import { ElMessage, FormInstance } from "element-plus";
import { reactive, ref } from "vue";
//表单ref属性
const addFormRef = ref<FormInstance>();
//弹框属性
const { dialog, onClose, onConfirm, onShow } = useDialog();
const types = ref("");
//显示弹框
const show = (roomId: string, roomCode: string, status: string) => {
  dialog.title = "入住信息登记";
  dialog.height = 200;
  addModel.roomCode = roomCode;
  addModel.roomId = roomId;
  types.value = status;
  onShow();
  addFormRef.value?.resetFields()
};
//暴露出去
defineExpose({
  show,
});
//表单绑定的数据
const addModel = reactive({
  name: "",
  phone: "",
  cardType: "",
  cardNum: "",
  sex: "",
  roomId: "",
  roomCode: "",
});
//表单验证规则
const rules = reactive({
  name: [
    {
      trigger: "blur",
      message: "请录入姓名",
      required: true,
    },
  ],
  phone: [
    {
      trigger: "blur",
      message: "请录入电话",
      required: true,
    },
  ],
  cardType: [
    {
      trigger: "blur",
      message: "请录入证件类型",
      required: true,
    },
  ],
  cardNum: [
    {
      trigger: "blur",
      message: "请录入证件号码",
      required: true,
    },
  ],
  sex: [
    {
      trigger: "blur",
      message: "请选择性别",
      required: true,
    },
  ],
});
//注册事件
const emits = defineEmits(['onRefsh'])
//表单提交
const commit = () => {
  addFormRef.value?.validate(async (valid) => {
    if (valid) {
      let res = null;
      if (types.value == "0") {
        res = await addOrderApi(addModel);
      } else {
        res = await bookOrderApi(addModel);
      }
      if(res && res.code == 200){
        ElMessage.success(res.msg)
        emits('onRefsh')
        onClose()
      }
    }
  });
};
</script>

<style scoped></style>

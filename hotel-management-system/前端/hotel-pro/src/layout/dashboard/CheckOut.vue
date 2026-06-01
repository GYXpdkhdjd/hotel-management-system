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
              <el-input disabled v-model="addModel.name"></el-input>
            </el-form-item>
          </el-col>
          <el-col :span="12" :offset="0">
            <el-form-item prop="sex" label="性别">
              <el-radio-group disabled v-model="addModel.sex">
                <el-radio :label="'0'">男</el-radio>
                <el-radio :label="'1'">女</el-radio>
              </el-radio-group>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12" :offset="0">
            <el-form-item prop="phone" label="电话">
              <el-input disabled v-model="addModel.phone"></el-input>
            </el-form-item>
          </el-col>
          <el-col :span="12" :offset="0">
            <el-form-item prop="cardType" label="证件类型">
              <el-input disabled v-model="addModel.cardType"></el-input>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12" :offset="0">
            <el-form-item prop="cardNum" label="证件号码">
              <el-input disabled v-model="addModel.cardNum"></el-input>
            </el-form-item>
          </el-col>
          <el-col :span="12" :offset="0">
            <el-form-item prop="intoTime" label="入住时间">
              <el-input disabled v-model="addModel.intoTime"></el-input>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12" :offset="0">
            <el-form-item prop="price" label="金额">
              <el-input type="number" v-model="addModel.price"></el-input>
            </el-form-item>
          </el-col>
        </el-row>
      </el-form>
    </template>
  </SysDialog>
</template>

<script setup lang="ts">
import { getInfoByIdApi,checkOrderApi } from "@/api/home/index";
import SysDialog from "@/components/SysDialog.vue";
import useDialog from "@/hooks/useDialog";
import { ElMessage, FormInstance } from "element-plus";
import { reactive, ref } from "vue";
//表单ref属性
const addFormRef = ref<FormInstance>();
//弹框属性
const { dialog, onClose, onConfirm, onShow } = useDialog();
//表单绑定的数据
const addModel = reactive({
  orderId: "",
  name: "",
  phone: "",
  cardType: "",
  cardNum: "",
  sex: "",
  roomId: "",
  roomCode: "",
  price: "",
  intoTime: "",
});
//显示弹框
const show = async (roomId: string) => {
  addFormRef.value?.resetFields();
  dialog.title = "办理退房信息";
  dialog.height = 200;
  addModel.roomId = roomId;
  onShow();
  //根据id查询
  let res = await getInfoByIdApi(roomId);
  if (res && res.code == 200) {
    console.log(res.data);
    Object.assign(addModel, res.data);
  }
};
//暴露出去
defineExpose({
  show,
});

//表单验证规则
const rules = reactive({
  price: [
    {
      trigger: "blur",
      message: "请输入金额",
      required: "true",
    },
  ]
});
//注册事件
const emits = defineEmits(["onRefsh"]);
//表单提交
const commit = () => {
  addFormRef.value?.validate(async (valid) => {
    if (valid) {
        let res = await checkOrderApi({
            orderId:addModel.orderId,
            price:addModel.price,
            roomId:addModel.roomId
        })
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

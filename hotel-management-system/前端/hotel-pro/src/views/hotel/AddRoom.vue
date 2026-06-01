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
        <el-form-item prop="roomCode" label="房间编号">
          <el-input v-model="addModel.roomCode"></el-input>
        </el-form-item>
      </el-form>
    </template>
  </SysDialog>
</template>

<script setup lang="ts">
import {
  AddRoom,
  HotelInfoType,
  RoomType,
} from "@/api/hotel_info/HotelInfoModel";
import SysDialog from "@/components/SysDialog.vue";
import useDialog from "@/hooks/useDialog";
import { EditType, Title } from "@/type/BaseEnum";
import { ElMessage, FormInstance } from "element-plus";
import { nextTick, reactive, ref } from "vue";
import { addRoomApi, editRoomApi } from "@/api/hotel_info";
//表单的ref属性
const addFormRef = ref<FormInstance>();
//弹框属性
const { dialog, onClose, onConfirm, onShow } = useDialog();
//设置传递给父组件的值
const rows = ref("");
//弹框显示
const show = (type: string, row?: HotelInfoType, child?: RoomType) => {
  dialog.height = 150;
  onShow();
  if (type == EditType.ADD) {
    if (row) {
      addModel.infoId = row.infoId;
      rows.value = row.infoId;
    }
  } else {
    nextTick(() => {
      console.log(child);
      Object.assign(addModel, child);
      console.log(addModel);
      rows.value = addModel.infoId;
    });
  }
  type == EditType.ADD
    ? (dialog.title = Title.ADD)
    : (dialog.title = Title.EDIT);
  addFormRef.value?.resetFields();
  addModel.type = type;
};
//暴露出去
defineExpose({
  show,
});
//表单绑定的对象
const addModel = reactive<AddRoom>({
  type: "",
  roomId: "",
  infoId: "",
  roomCode: "",
  intoStatus: "",
  bookStatus: "",
  useStatus: "",
});
//表单验证规则
const rules = reactive({
  roomCode: [
    {
      required: true,
      message: "请填写房间编号",
      trigger: "blur",
    },
  ],
});
//注册事件
const emits = defineEmits(["onFresh"]);
//表单提交
const commit = () => {
  addFormRef.value?.validate(async (valid) => {
    if (valid) {
      let res = null;
      if (addModel.type == EditType.ADD) {
        res = await addRoomApi(addModel);
      } else {
        res = await editRoomApi(addModel);
      }
      if (res && res.code == 200) {
        ElMessage.success(res.msg);
        //刷新表格
        emits("onFresh", rows.value);
        onClose();
      }
    }
  });
};
</script>

<style scoped></style>

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
        <el-form-item prop="title" label="标题">
          <el-input v-model="addModel.title"></el-input>
        </el-form-item>
        <el-form-item prop="infoId" label="客房">
          <el-select
            style="width: 100%"
            v-model="addModel.infoId"
            placeholder="选择客房"
          >
            <el-option
              v-for="item in hotelData.list"
              :key="item.value"
              :label="item.label"
              :value="item.value"
            />
          </el-select>
        </el-form-item>
        <el-form-item prop="status" label="状态">
          <el-radio-group v-model="addModel.status">
            <el-radio :label="true">上架</el-radio>
            <el-radio :label="false">下架</el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item prop="images" label="广告图片">
          <el-upload
            ref="uploadRef"
            action="#"
            :on-change="uploadFile"
            list-type="picture-card"
            :auto-upload="false"
            :file-list="fileList"
            :limit="1"
            :on-remove="handleRemove"
            :on-exceed="moreLimit"
          >
            <el-icon><Plus /></el-icon>
          </el-upload>
          <el-dialog v-model="dialogVisible">
            <img w-full :src="dialogImageUrl" alt="Preview Image" />
          </el-dialog>
        </el-form-item>
      </el-form>
    </template>
  </SysDialog>
</template>

<script setup lang="ts">
import useUpload from "@/composables/img_upload/useUpload";
import { BannerType } from "@/api/banner/BannerModel";
import SysDialog from "@/components/SysDialog.vue";
import useDialog from "@/hooks/useDialog";
import { ElMessage, FormInstance } from "element-plus";
import { nextTick, reactive, ref, watch } from "vue";
import { addApi,editApi } from "@/api/banner/index";
import useSelectHotel from "@/composables/banner/useSelectHotel";
import { EditType, Title } from "@/type/BaseEnum";
//客房下拉
const { listHotel, hotelData } = useSelectHotel();
const addFormRef = ref<FormInstance>();
//图片上传
const {
  dialogImageUrl,
  dialogVisible,
  disabled,
  handleRemove,
  handlePictureCardPreview,
  uploadFile,
  uploadRef,
  imgUrl,
  fileList,
  moreLimit,
} = useUpload();
//监听图片路径
watch(
  () => imgUrl.value,
  () => {
    let img = "";
    for (let k = 0; k < imgUrl.value.length; k++) {
      img = img + imgUrl.value[k].url + ",";
    }
    addModel.images = img.substring(0, img.lastIndexOf(","));
  },
  {
    deep: true,
  }
);
//弹框属性
const { dialog, onClose, onConfirm, onShow } = useDialog();
//显示弹框
const show = (type: string, row: BannerType) => {
  imgUrl.value = [];
  //清空图片数据
  fileList.value = [];
  if (uploadRef.value) {
    uploadRef.value.clearFiles();
  }
  //查询客房下拉数据
  listHotel();
  dialog.height = 330;
  type == EditType.ADD
    ? (dialog.title = Title.ADD)
    : (dialog.title = Title.EDIT);
  onShow();
  //编辑：数据回显
  if (row && type == EditType.EDIT) {
    nextTick(() => {
      Object.assign(addModel, row);
      //图片回显
      if (addModel.images) {
        //逗号分隔转换为数组
        let imgs = addModel.images.split(",");
        for (let i = 0; i < imgs.length; i++) {
          let img = { name: "", url: "" };
          img.name = imgs[i];
          img.url = imgs[i];
          //放到图片上传组件的数据里面
          fileList.value.push(img);
          imgUrl.value.push({ url: imgs[i] });
        }
      }
    });
  }
  addModel.type = type;
};
//暴露出去
defineExpose({
  show,
});
//表单绑定的对象
const addModel = reactive<BannerType>({
  type: "",
  banId: "",
  infoId: "",
  title: "",
  images: "",
  status: "",
});
//表单验证规则
const rules = reactive({
  infoId: [
    {
      trigger: "blur",
      message: "请选择客房",
      required: true,
    },
  ],
  title: [
    {
      trigger: "blur",
      message: "请填写",
      required: true,
    },
  ],
  images: [
    {
      trigger: "blur",
      message: "请上传图片",
      required: true,
    },
  ],
  status: [
    {
      trigger: "blur",
      message: "请选择状态",
      required: true,
    },
  ],
});
//注册事件
const emits = defineEmits(['onFresh'])
//表单提交
const commit = () => {
  addFormRef.value?.validate(async (valid) => {
    if (valid) {
      console.log(addModel);
      let res = null;
      if(addModel.type == EditType.ADD){
        res = await addApi(addModel);
      }else{
        res = await editApi(addModel);
      }
      if (res && res.code == 200) {
        ElMessage.success(res.msg);
        //刷新表格
        emits('onFresh')
        onClose();
      }
    }
  });
};
</script>

<style scoped></style>

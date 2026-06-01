<template>
  <el-drawer
    size="50%"
    custom-class="faDrawer"
    v-model="drawer"
    direction="rtl"
    :append-to-body="true"
    :close-on-click-modal="false"
  >
    <template #title>
      <div class="car-title">
        <span>{{ title }}</span>
      </div>
    </template>
    <template #default>
      <el-form
        :model="addModel"
        ref="addFormRef"
        :rules="rules"
        label-width="80px"
        size="default"
      >
        <el-row>
          <el-col :span="12" :offset="0">
            <el-form-item prop="infoName" label="客房名称">
              <el-input v-model="addModel.infoName"></el-input>
            </el-form-item>
          </el-col>
          <el-col :span="12" :offset="0">
            <el-form-item prop="typeId" label="客房类型">
              <el-select
                style="width: 100%"
                v-model="addModel.typeId"
                placeholder="选择客房类型"
              >
                <el-option
                  v-for="item in selectData.list"
                  :key="item.value"
                  :label="item.label"
                  :value="item.value"
                />
              </el-select>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12" :offset="0">
            <el-form-item prop="infoPrice" label="客房价格">
              <el-input type="number" v-model="addModel.infoPrice"></el-input>
            </el-form-item>
          </el-col>
          <el-col :span="12" :offset="0">
            <el-form-item prop="infoBed" label="床位数">
              <el-input type="number" v-model="addModel.infoBed"></el-input>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12" :offset="0">
            <el-form-item prop="infoCount" label="可住人数">
              <el-input type="number" v-model="addModel.infoCount"></el-input>
            </el-form-item>
          </el-col>
          <el-col :span="12" :offset="0">
            <el-form-item prop="infoStatus" label="状态">
              <el-radio-group v-model="addModel.infoStatus">
                <el-radio :label="true">启用</el-radio>
                <el-radio :label="false">停用</el-radio>
              </el-radio-group>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row v-if="addModel.type == '0'">
          <el-col :span="12" :offset="0">
            <el-form-item prop="start" label="起始编号">
              <el-input type="number" v-model="addModel.start"></el-input>
            </el-form-item>
          </el-col>
          <el-col :span="12" :offset="0">
            <el-form-item prop="end" label="结束编号">
              <el-input type="number" v-model="addModel.end"></el-input>
            </el-form-item>
          </el-col>
        </el-row>
        <el-form-item prop="orderNum" label="序号">
          <el-input type="number" v-model="addModel.orderNum"></el-input>
        </el-form-item>
        <el-form-item prop="checkService" label="客房服务">
          <el-checkbox-group v-model="addModel.checkService">
            <el-checkbox
              v-for="item in addModel.service"
              :label="item.serviceId"
              >{{ item.name }}</el-checkbox
            >
          </el-checkbox-group>
        </el-form-item>
        <el-form-item prop="imgUrl" label="客房图片">
          <el-upload
            ref="uploadRef"
            action="#"
            :on-change="uploadFile"
            list-type="picture-card"
            :auto-upload="false"
            :file-list="fileList"
            :limit="3"
            :on-remove="handleRemove"
            :on-exceed="moreLimit"
          >
            <el-icon><Plus /></el-icon>
          </el-upload>
          <el-dialog v-model="dialogVisible">
            <img w-full :src="dialogImageUrl" alt="Preview Image" />
          </el-dialog>
        </el-form-item>
        <el-form-item prop="infoDetails" label="客房详情">
          <div style="border: 1px solid #ccc">
            <Toolbar
              style="border-bottom: 1px solid #ccc"
              :editor="editorRef"
              :defaultConfig="toolbarConfig"
              :mode="mode"
            />
            <Editor
              style="height: 300px; overflow-y: hidden"
              v-model="valueHtml"
              :defaultConfig="editorConfig"
              :mode="mode"
              @onCreated="handleCreated"
            />
          </div>
        </el-form-item>
      </el-form>
    </template>
    <template #footer>
      <div style="flex: auto">
        <el-button type="danger" plain @click="cancelClick">取消</el-button>
        <el-button type="primary" @click="commit">确定</el-button>
      </div>
    </template>
  </el-drawer>
</template>

<script setup lang="ts">
import "@wangeditor/editor/dist/css/style.css"; // 引入 css
import { Editor, Toolbar } from "@wangeditor/editor-for-vue";
import useSelectType from "@/composables/hotel_info/useSelectType";
import { HotelInfoType } from "@/api/hotel_info/HotelInfoModel";
import useHotelInfo from "@/composables/hotel_info/useHotelInfo";
import { EditType, Title } from "@/type/BaseEnum";
import { ElMessage, FormInstance } from "element-plus";
import { nextTick, reactive, ref, watch } from "vue";
import useUpload from "@/composables/img_upload/useUpload";
import useEditor from "@/composables/hotel_info/useEditor";
import {
  addApi,
  getServiceListApi,
  getCheckListApi,
  editApi,
} from "@/api/hotel_info";
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
//文本编辑器
const {
  editorRef,
  handleCreated,
  editorConfig,
  valueHtml,
  toolbarConfig,
  mode,
} = useEditor();
//客房类型
const { selectData, getSelectList } = useSelectType();
//表单属性
const addFormRef = ref<FormInstance>();
//新增
const { drawer, cancelClick } = useHotelInfo();
//标题
const title = ref("");
//显示抽屉
const show = async (type: string, row?: HotelInfoType) => {
  addModel.infoId = ''
  imgUrl.value = [];
  //清空图片数据
  fileList.value = [];
  if (uploadRef.value) {
    uploadRef.value.clearFiles();
  }
  //清空编辑器数据
  if (editorRef.value) {
    editorRef.value.clear();
  }
  //获取客房数据类型
  await getSelectList();
  getServiceList();
  type == EditType.ADD ? (title.value = Title.ADD) : (title.value = Title.EDIT);
  drawer.value = true;
  //编辑回显数据
  if (row && type == EditType.EDIT) {
    nextTick(() => {
      Object.assign(addModel, row);
      //获取回显的服务信息
      getCheckList(row.infoId);
      //图片回显
      if (addModel.imgUrl) {
        //逗号分隔转换为数组
        let imgs = addModel.imgUrl.split(",");
        for (let i = 0; i < imgs.length; i++) {
          let img = { name: "", url: "" };
          img.name = imgs[i];
          img.url = imgs[i];
          //放到图片上传组件的数据里面
          fileList.value.push(img);
          imgUrl.value.push({ url: imgs[i] });
        }
      }
      //编辑器数据回显
      valueHtml.value = addModel.infoDetails;
    });
  }
  //清空表单
  addFormRef.value?.resetFields();
  console.log(addModel)
  addModel.type = type;
};
//客房服务回显
const getCheckList = async (infoId: string) => {
  let res = await getCheckListApi(infoId);
  if (res && res.code == 200) {
    addModel.checkService = res.data;
  }
};
//客房服务列表
const getServiceList = async () => {
  let res = await getServiceListApi();
  if (res && res.code == 200) {
    addModel.service = res.data;
  }
};
//暴露出去
defineExpose({
  show,
});
//表单绑定的对象
const addModel = reactive<HotelInfoType>({
  type: "",
  infoId: "",
  typeId: "",
  infoName: "",
  imgUrl: "",
  infoDetails: "",
  infoPrice: "",
  infoBed: "",
  infoCount: "",
  infoStatus: "",
  start: "",
  end: "",
  orderNum: "",
  service: [],
  checkService: [],
});
//服务验证
const checkService = (rule: any, value: any, callback: any) => {
  if (value.length == 0) {
    callback(new Error("请选择服务"));
  } else {
    callback();
  }
};
const checkEdit = (rule: any, value: any, callback: any) => {
  if (editorRef.value.getText().length == 0) {
    callback(new Error("请填写客房详情"));
  } else {
    callback();
  }
};
//表单验证规则
const rules = reactive({
  typeId: [
    {
      trigger: "blur",
      message: "请选择客房类型",
      required: true,
    },
  ],
  infoName: [
    {
      trigger: "blur",
      message: "请输入客房名称",
      required: true,
    },
  ],
  imgUrl: [
    {
      trigger: "blur",
      message: "请上传客房图片",
      required: true,
    },
  ],
  infoDetails: [
    {
      trigger: "blur",
      validator: checkEdit,
      required: true,
    },
  ],
  infoPrice: [
    {
      trigger: "blur",
      message: "请输入客房价格",
      required: true,
    },
  ],
  infoBed: [
    {
      trigger: "blur",
      message: "请输入客房床位数",
      required: true,
    },
  ],
  infoCount: [
    {
      trigger: "blur",
      message: "请填写可住人数",
      required: true,
    },
  ],
  infoStatus: [
    {
      trigger: "blur",
      message: "请选择状态",
      required: true,
    },
  ],
  start: [
    {
      trigger: "blur",
      message: "请填写起始编号",
      required: true,
    },
  ],
  checkService: [{ validator: checkService, trigger: "blur", required: true }],
});
//监听图片路径
watch(
  () => imgUrl.value,
  () => {
    let img = "";
    for (let k = 0; k < imgUrl.value.length; k++) {
      img = img + imgUrl.value[k].url + ",";
    }
    addModel.imgUrl = img.substring(0, img.lastIndexOf(","));
  },
  {
    deep: true,
  }
);
//设置文本编辑器的内容
watch(
  () => valueHtml.value,
  (value) => {
    if (valueHtml.value) {
      addModel.infoDetails = value;
    }
  }
);
//注册事件
const emits = defineEmits(["onRefsh"]);
//提交
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
        emits("onRefsh");
        ElMessage.success(res.msg);
        drawer.value = false;
      }
    }
  });
};
</script>

<style lang="scss">
.faDrawer {
  .el-drawer__header {
    font-size: 16px;
    padding: 12.5px;
    margin-bottom: 0px !important;
    background-color: #009688 !important;
    .el-drawer__close {
      color: #fff !important;
    }
  }
  .car-title {
    color: #fff;
    font-size: 16px;
    display: flex;
    align-items: center;
  }
  .el-drawer__footer {
    border-top: 1px solid #e8eaec !important;
    padding: 10px;
  }
}
</style>

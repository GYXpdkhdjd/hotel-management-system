<template>
  <el-dialog
    :model-value="visible"
    :title="title"
    :width="width+'px'"
    :close-on-click-modal="false"
    append-to-body
    :before-close="onClose"
  >
    <div class="container" :style="{ height: height + 'px' }">
      <slot name="content"></slot>
    </div>
    <template #footer>
      <span class="dialog-footer">
        <el-button type="danger" @click="onClose">取消</el-button>
        <el-button type="primary" @click="onConfirm">确定</el-button>
      </span>
    </template>
  </el-dialog>
</template>

<script setup lang="ts">
//定义参数的类型
interface DialogProps {
  title: string;
  visible: boolean;
  width: number;
  height: number;
}
//子组件接收父组件的值
//withDefaults:设置默认值  defineProps：接收父组件的参数
const props = withDefaults(defineProps<DialogProps>(), {
  title: "标题",
  height: 280,
  width: 630,
  visible: false,
});
//注册事件
const emits = defineEmits(["onConfirm", "onClose"]);
//弹框的确定事件
const onConfirm = () => {
  emits("onConfirm");
};
//弹框的取消事件
const onClose = () => {
  emits("onClose");
};
</script>
<style lang="scss" scope>
.container {
  overflow-x: initial;
  overflow-y: auto;
}
.el-dialog {
  border-top-left-radius: 7px !important;
  border-top-right-radius: 7px !important;
  .el-dialog__header {
    margin-right: 0px;
    border-top-left-radius: 7px !important;
    border-top-right-radius: 7px !important;
    background-color: #009688 !important;
    .el-dialog__title {
      color: #fff;
      font-size: 16px;
      font-weight: 600;
    }
  }
  .el-dialog__headerbtn {
    .el-dialog__close {
      color: #fff;
    }
  }
  .el-dialog__body {
    padding: 10px;
  }
  .el-dialog__footer {
    border-top: 1px solid #e8eaec !important;
    padding: 10px;
  }
}
</style>

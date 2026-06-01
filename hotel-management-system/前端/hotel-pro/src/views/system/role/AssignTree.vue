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
      <el-tree
        ref="assignTree"
        :data="assignTreeData.list"
        node-key="menuId"
        :props="defaultProps"
        empty-text="暂无数据"
        :show-checkbox="true"
        default-expand-all
        :highlight-current="true"
        :default-checked-keys="assignTreeData.assignTreeChecked"
      ></el-tree>
    </template>
  </SysDialog>
</template>

<script setup lang="ts">
import SysDialog from "@/components/SysDialog.vue";
import useDialog from "@/hooks/useDialog";
import useAssign from "@/composables/role/useAssign";
import { userStore } from "@/store/user";
import { ref, reactive } from "vue";
import { ElMessage, ElTree } from "element-plus";
import { SaveAssignParm } from "@/api/role/RoleModel";
import { assignSaveApi } from "@/api/role/index";
//树的ref属性
const assignTree = ref<InstanceType<typeof ElTree>>();
const store = userStore();
const { defaultProps, getAssignTree, assignTreeData } = useAssign();
//弹框属性
const { dialog, onClose, onConfirm, onShow } = useDialog();
//提交的数据
const saveParm = reactive<SaveAssignParm>({
  list: [],
  roleId: "",
});
//弹框显示
const show = (roleId: string, name: string) => {
  assignTreeData.assignTreeChecked = [];
  assignTreeData.list = [];
  saveParm.roleId = roleId;
  getAssignTree({
    roleId: roleId,
    userId: store.getUserId,
  });
  //设置弹框属性
  dialog.title = "为【" + name + "】分配权限";
  dialog.width = 300;
  dialog.height = 450;
  onShow();
};
//暴露出去
defineExpose({
  show,
});

//提交
const commit = async () => {
  let checkedIds = assignTree.value?.getCheckedKeys(false) as string[];
  let hlfIds = assignTree.value?.getHalfCheckedKeys() as string[];
  let ids = checkedIds?.concat(hlfIds);
  saveParm.list = ids;
  //判断是否已经勾选权限
  if (saveParm.list.length == 0) {
    ElMessage.warning("请勾选权限");
    return;
  }
  let res = await assignSaveApi(saveParm);
  if (res && res.code == 200) {
    onClose();
    ElMessage.success(res.msg);
  }
};
</script>

<style scoped></style>

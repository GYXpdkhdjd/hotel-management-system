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
        <el-row>
          <el-col :span="12" :offset="0">
            <el-form-item prop="nickName" label="姓名">
              <el-input v-model="addModel.nickName"></el-input>
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
            <el-form-item prop="email" label="邮箱">
              <el-input v-model="addModel.email"></el-input>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12" :offset="0">
            <el-form-item prop="roleId" label="角色">
              <el-select v-model="addModel.roleId" placeholder="选择角色">
                <el-option
                  v-for="item in roleData.list"
                  :key="item.value"
                  :label="item.label"
                  :value="item.value"
                />
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="12" :offset="0">
            <el-form-item prop="enabled" label="状态">
              <el-radio-group v-model="addModel.enabled">
                <el-radio :label="true">启用</el-radio>
                <el-radio :label="false">停用</el-radio>
              </el-radio-group>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12" :offset="0">
            <el-form-item prop="salary" label="薪水">
              <el-input type="number" v-model="addModel.salary"></el-input>
            </el-form-item>
          </el-col>
          <el-col :span="12" :offset="0">
            <el-form-item prop="username" label="账户">
              <el-input v-model="addModel.username"></el-input>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row v-if="addModel.type == '0'">
          <el-col :span="12" :offset="0">
            <el-form-item prop="password" label="密码">
              <el-input type="password" v-model="addModel.password"></el-input>
            </el-form-item>
          </el-col>
        </el-row>
      </el-form>
    </template>
  </SysDialog>
</template>

<script setup lang="ts">
import { nextTick, reactive, ref } from "vue";
import { AddUserModel } from "@/api/user/UserModel";
import SysDialog from "@/components/SysDialog.vue";
import useDialog from "@/hooks/useDialog";
import { ElMessage, FormInstance } from "element-plus";
import useSelectRole from "@/composables/user/useSelectRole";
import { addApi,editApi } from "@/api/user";
import { EditType, Title } from "@/type/BaseEnum";
//角色数据
const { listRole, roleData ,getRoleId} = useSelectRole();
//表单的ref属性
const addFormRef = ref<FormInstance>();
//弹框属性
const { dialog, onClose, onConfirm, onShow } = useDialog();
//弹框显示
const show = async (type:string,row?:AddUserModel) => {
  //清空数据
  roleData.list = []
  roleData.roleId = ''
  //设置弹框属性
  dialog.height = 250;
  type == EditType.ADD ? dialog.title = Title.ADD : dialog.title = Title.EDIT
  //获取下拉角色数据
  await listRole();
  onShow();
  //设置编辑数据的回显
  if(row && type == EditType.EDIT){
     await getRoleId(row.userId)
     nextTick(()=>{
       Object.assign(addModel,row)
       addModel.roleId = roleData.roleId as string
       addModel.password = ''
     })
  }
  addModel.type = type;
  addFormRef.value?.resetFields()
};
//暴露出去
defineExpose({
  show,
});
//表单绑定的对象
const addModel = reactive<AddUserModel>({
  type: "", //主要是用了区分 新增还是编辑 0：新增 1：编辑
  userId: "",
  roleId: "",
  username: "",
  password: "",
  phone: "",
  email: "",
  sex: "",
  enabled: true,
  nickName: "",
  salary: "",
});
//表单验证规则
const rules = reactive({
  nickName: [
    {
      required: true,
      trigger: "blur",
      message: "请填写姓名",
    },
  ],
  phone: [
    {
      required: true,
      trigger: "blur",
      message: "请输入电话",
    },
  ],
  sex: [
    {
      required: true,
      trigger: "blur",
      message: "请输选择性别",
    },
  ],
  enabled: [
    {
      required: true,
      trigger: "blur",
      message: "请输选择状态",
    },
  ],
  username: [
    {
      required: true,
      trigger: "blur",
      message: "请输入账户",
    },
  ],
  password: [
    {
      required: true,
      trigger: "blur",
      message: "请输入密码",
    },
  ],
  roleId: [
    {
      required: true,
      trigger: "blur",
      message: "请选择角色",
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
      if(addModel.type == EditType.ADD){
        res = await addApi(addModel);
      }else{
        res = await editApi(addModel);
      }
      if (res && res.code == 200) {
        ElMessage.success(res.msg);
        emits('onRefsh')
        onClose();
      }
    }
  });
};
</script>

<style scoped></style>

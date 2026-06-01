<template>
  <div class="logincontainer">
    <el-form
      :model="loginModel"
      class="formstyle"
      ref="loginForm"
      :rules="rules"
      size="default"
    >
      <el-form-item>
        <div class="loginTitleStyle">系统登录</div>
      </el-form-item>
      <el-form-item prop="username">
        <el-input
          size="large"
          v-model="loginModel.username"
          placeholder="请输入账号"
        ></el-input>
      </el-form-item>
      <el-form-item prop="password">
        <el-input
          type="password"
          size="large"
          v-model="loginModel.password"
          placeholder="请输入密码"
        ></el-input>
      </el-form-item>
      <el-form-item prop="code">
        <el-row :gutter="20">
          <el-col :span="16" :offset="0">
            <el-input
              size="large"
              v-model="loginModel.code"
              placeholder="请输入验证码"
            ></el-input>
          </el-col>
          <el-col :span="8" :offset="0">
            <img :src="imgSrc" class="image" @click="getImage" />
          </el-col>
        </el-row>
      </el-form-item>
      <el-form-item>
        <el-row style="width: 100%; margin-top: 20px">
          <el-col
            :span="12"
            :offset="0"
            style="padding-right: 10px; padding-left: 0px"
          >
            <el-button
              style="width: 100%"
              size="large"
              type="primary"
              @click="onSubmit"
              >登录</el-button
            >
          </el-col>
          <el-col
            :span="12"
            :offset="0"
            style="padding-right: 0px; padding-left: 10px"
          >
            <el-button type="danger" plain style="width: 100%" size="large"
              >重置</el-button
            >
          </el-col>
        </el-row>
      </el-form-item>
    </el-form>
  </div>
</template>

<script setup lang="ts">
import { FormInstance } from "element-plus";
import { ref, reactive } from "vue";
import { loginApi } from "@/api/login/index";
import useImage from "@/composables/login/useImage";
import { userStore } from "@/store/user/index";
import { useRouter } from "vue-router";
const { imgSrc, getImage } = useImage();
const loginForm = ref<FormInstance>();
const store = userStore()
const router = useRouter()
//表单绑定对象
const loginModel = reactive({
  username: "admin",
  password: "123456",
  code: "",
});
//表单验证规则
const rules = reactive({
  username: [
    {
      required: true,
      message: "请输入账号",
      trigger: "blur",
    },
  ],
  password: [
    {
      required: true,
      message: "请输入密码",
      trigger: "blur",
    },
  ],
  code: [
    {
      required: true,
      message: "请输入验证码",
      trigger: "blur",
    },
  ],
});
//登录提交
const onSubmit = async () => {
  loginForm.value?.validate(async (valid) => {
    if (valid) {
      let res = await loginApi(loginModel);
      if (res && res.code == 200) {
        //保存token和userId
        store.setToken(res.data.token)
        store.setUserId(res.data.userId)
        //跳转首页
        router.push({path:'/'})
      }
    }
  });
};
</script>

<style scoped lang="scss">
.logincontainer {
  height: 100%;
  background: #fff;
  background-image: url("../../assets/login_bg.png");
  background-size: 100% 100%;
  display: flex;
  justify-content: center;
  align-items: center;
  .formstyle {
    border-radius: 10px;
    background: #fff;
    height: 320px;
    width: 420px;
    padding: 20px 35px;
    .loginTitleStyle {
      width: 100%;
      font-size: 24px;
      font-weight: bold;
      display: flex;
      justify-content: center;
      align-items: center;
    }
    .image {
      height: 40px;
      width: 100%;
      display: flex;
      justify-content: center;
      align-items: center;
      cursor: pointer;
    }
  }
}
</style>

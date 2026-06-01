<template>
  <el-container class="layout">
    <el-aside class="asside" width="auto">
      <menu-bar></menu-bar>
    </el-aside>
    <el-container>
      <el-header height="50px" class="header">
        <Header></Header>
      </el-header>
      <el-main class="main">
        <Tabs style="padding: 0px 20px"></Tabs>
        <router-view></router-view>
      </el-main>
    </el-container>
  </el-container>
</template>

<script setup lang="ts">
//vue3里面，组件引入之后，直接使用，无需注册
import Header from "@/layout/header/Header.vue";
import MenuBar from "@/layout/menu/MenuBar.vue";
import Tabs from "./tabs/Tabs.vue";
</script>

<style scoped lang="scss">
.el-menu-vertical-demo:not(.el-menu--collapse) {
  width: 200px;
  min-height: 400px;
}
.layout {
  height: 100%;
  .asside {
    // background-color: blueviolet;
    background-color: #304156;
  }
  .header {
    background-color: #009688;
    display: flex;
    align-items: center;
    justify-content: space-between;
  }
  .main {
    padding-top: 1px;
    padding-left: 0px !important;
    padding-right: 0px !important;
  }
}
</style>

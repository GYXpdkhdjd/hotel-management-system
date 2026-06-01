<template>
  <el-main>
    <!-- 搜索栏 -->
    <el-form
      :model="listParm"
      :inline="true"
      size="default"
    >
      <el-form-item>
        <el-input v-model="listParm.nickName" placeholder="请输入姓名"></el-input>
      </el-form-item>
      <el-form-item>
        <el-input v-model="listParm.phone" placeholder="请输入电话"></el-input>
      </el-form-item>
      <el-form-item>
        <el-button @click="searchBtn" :icon="Search">搜索</el-button>
        <el-button @click="resetBtn" :icon="Close" type="danger" plain>重置</el-button>
        <el-button v-if="global.$hasPerm(['sys:user:add'])" type="primary" :icon="Plus"  @click="addBtn">新增</el-button>
      </el-form-item>
    </el-form>
    <!-- 表格 -->
    <el-table :height="tableHeight" :data="tableList.list" border stripe>
      <el-table-column prop="nickName" label="姓名"></el-table-column>
      <el-table-column prop="sex" label="性别">
        <template #default="scope">
          <el-tag v-if="scope.row.sex == '0'" type="success" size="default">男</el-tag>
          <el-tag v-if="scope.row.sex == '1'" type="danger" size="default">女</el-tag>
        </template>
      </el-table-column>
      <el-table-column prop="phone" label="电话"></el-table-column>
      <el-table-column prop="salary" label="薪水"></el-table-column>
      <el-table-column prop="email" label="邮箱"></el-table-column>
      <el-table-column prop="username" label="账户"></el-table-column>
      <el-table-column prop="enabled" label="是否启用">
        <template #default="scope">
          <el-tag v-if="scope.row.enabled" type="success" size="default">启用</el-tag>
          <el-tag v-else type="danger" size="default">停用</el-tag>
        </template>
      </el-table-column>
      <el-table-column v-if="global.$hasPerm(['sys:user:resetPasword','sys:user:edit','sys:user:delete'])"  label="操作" width="320" align="center">
        <template #default="scope">
          <el-button v-if="global.$hasPerm(['sys:user:edit'])" type="primary" :icon="Edit" size="default" @click="editBtn(scope.row)">编辑</el-button>
          <el-button v-if="global.$hasPerm(['sys:user:delete'])" type="danger" :icon="Delete" size="default" @click="deleteBtn(scope.row)">删除</el-button>
          <el-button v-if="global.$hasPerm(['sys:user:resetPasword'])" type="warning" :icon="Delete" size="default" @click="resetPawBtn(scope.row)">重置密码</el-button>
        </template>
      </el-table-column>
    </el-table>
    <!-- 分页 -->
    <el-pagination
      @size-change="sizeChange"
      @current-change="currentChange"
      :current-page.sync="listParm.currentPage"
      :page-sizes="[10,20, 40, 80, 100]"
      :page-size="listParm.pageSize"
      layout="total, sizes, prev, pager, next, jumper"
      :total="listParm.total" background>
    </el-pagination>
    
    <!-- 新增、编辑 -->
    <add-user ref="addRef" @onRefsh="getList"></add-user>
  </el-main>
</template>

<script setup lang="ts">
import AddUser from './AddUser.vue';
import { Search, Edit, Plus, Close, Delete } from '@element-plus/icons-vue';
import useTable from "@/composables/user/useTable";
import useUser from "@/composables/user/useUser";

//表格
const { listParm, getList, searchBtn, resetBtn ,tableList,sizeChange,currentChange,tableHeight} = useTable();
//新增、编辑
const { addBtn, editBtn, deleteBtn ,addRef,resetPawBtn,global} = useUser(getList);
</script>

<style scoped></style>

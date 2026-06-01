<template>
  <el-main>
    <!-- 搜索栏 -->
    <el-form :model="listParm" :inline="true" size="default">
      <el-form-item>
        <el-input
          v-model="listParm.name"
          placeholder="请输入类型名称"
        ></el-input>
      </el-form-item>
      <el-form-item>
        <el-button :icon="Search" @click="searchBtn">搜索</el-button>
        <el-button :icon="Close" @click="resetBtn" type="danger" plain>重置</el-button>
        <el-button v-if="global.$hasPerm(['sys:roomType:add'])" :icon="Plus" type="primary" @click="addBtn">新增</el-button>
      </el-form-item>
    </el-form>
    <!-- 表格 -->
    <el-table :height="tableHeight" :data="tableList.list" border stripe>
      <el-table-column prop="name" label="类型名称"></el-table-column>
      <el-table-column prop="orderNum" label="序号"></el-table-column>
      <el-table-column v-if="global.$hasPerm(['sys:roomType:edit','sys:roomType:delete'])" label="操作" width="200" align="center">
        <template #default="scope">
          <el-button v-if="global.$hasPerm(['sys:roomType:edit'])" :icon="Edit" type="primary" size="default" @click="editBtn(scope.row)">编辑</el-button>
          <el-button v-if="global.$hasPerm(['sys:roomType:delete'])" :icon="Delete" type="danger" size="default" @click="deleteBtn(scope.row)">删除</el-button>
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
    
    <!-- 新增弹框 -->
    <AddType ref="addRef" @onFresh="getList"></AddType>
  </el-main>
</template>

<script setup lang="ts">
import AddType from "./AddType.vue";
import { Search, Edit, Plus, Close, Delete } from "@element-plus/icons-vue";
import useType from "@/composables/type/useType";
import useTypeTable from "@/composables/type/useTypeTable";
//表格
const { listParm,searchBtn,resetBtn,getList,tableList ,sizeChange,currentChange,tableHeight} = useTypeTable();
//新增
const { addBtn, editBtn, deleteBtn,addRef,global } = useType(getList);
</script>

<style scoped></style>

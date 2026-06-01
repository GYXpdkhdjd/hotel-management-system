<template>
  <el-main>
    <!-- 搜索栏 -->
    <el-form :model="listParm" :inline="true" size="default">
      <el-form-item>
        <el-input
          v-model="listParm.title"
          placeholder="请输入关键字"
        ></el-input>
      </el-form-item>
      <el-form-item>
        <el-button :icon="Search" @click="searchBtn">搜索</el-button>
        <el-button :icon="Close" type="danger" @click="resetBtn" plain
          >重置</el-button
        >
        <el-button v-if="global.$hasPerm(['sys:banner:add'])" :icon="Plus" type="primary" @click="addBtn">新增</el-button>
      </el-form-item>
    </el-form>
    <!-- 表格 -->
    <el-table :height="tableHeight" :data="tableList" border stripe>
      <el-table-column prop="images" width="90" label="图片" align="center">
        <template #default="scope">
          <el-image
            style="width: 60px; height: 60px; border-radius: 50%"
            :src="scope.row.images.split(',')[0]"
          ></el-image>
        </template>
      </el-table-column>
      <el-table-column lable="标题" prop="title"></el-table-column>
      <el-table-column align="center" label="启用" show-overflow-tooltip>
        <template #default="{ row }">
          <el-switch
            v-model="row.status"
            active-color="#1890FF"
            inactive-color="#A9A8A8"
            @change="upBtn(row)"
          />
        </template>
      </el-table-column>
      <el-table-column v-if="global.$hasPerm(['sys:banner:edit','sys:banner:delete'])" label="操作" align="center" width="200">
        <template #default="scope">
          <el-button
            v-if="global.$hasPerm(['sys:banner:edit'])"
            :icon="Edit"
            type="primary"
            size="default"
            @click="editBtn(scope.row)"
            >编辑</el-button
          >
          <el-button
            v-if="global.$hasPerm(['sys:banner:delete'])"
            :icon="Delete"
            type="danger"
            size="default"
            @click="deleteBtn(scope.row)"
            >删除</el-button
          >
        </template>
      </el-table-column>
    </el-table>
    <!-- 分页 -->
    <el-pagination
      @size-change="sizeChange"
      @current-change="currentChange"
      :current-page.sync="listParm.currentPage"
      :page-sizes="[10, 20, 40, 80, 100]"
      :page-size="listParm.pageSize"
      layout="total, sizes, prev, pager, next, jumper"
      :total="listParm.total"
      background
    >
    </el-pagination>
  </el-main>
  <!-- 新增 -->
  <AddBanner ref="addRef" @onFresh="getList"></AddBanner>
</template>

<script setup lang="ts">
import useBanner from "@/composables/banner/useBanner";
import { Search, Edit, Plus, Close, Delete } from "@element-plus/icons-vue";
import useBannerTable from "@/composables/banner/useBannerTable";
import AddBanner from "./AddBanner.vue";
//表格操作
const {
  listParm,
  getList,
  searchBtn,
  resetBtn,
  tableList,
  upBtn,
  sizeChange,
  currentChange,
  tableHeight,
} = useBannerTable();
//新增
const { addBtn, editBtn, deleteBtn, addRef, global } = useBanner(getList);
</script>

<style scoped></style>

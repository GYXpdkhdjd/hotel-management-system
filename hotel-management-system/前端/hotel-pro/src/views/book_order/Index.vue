<template>
  <el-main>
    <!-- 搜索栏 -->
    <el-form :model="listParm" :inline="true" size="small">
      <el-form-item label="姓名">
        <el-input v-model="listParm.name"></el-input>
      </el-form-item>
      <el-form-item label="电话">
        <el-input v-model="listParm.phone"></el-input>
      </el-form-item>
      <el-form-item>
        <el-button :icon="Search" @click="searchBtn">搜索</el-button>
        <el-button :icon="Close" type="danger" plain @click="resetBtn"
          >重置</el-button
        >
      </el-form-item>
    </el-form>
    <!-- 表格 -->
    <el-table :height="tableHeigth" :data="tableList" border stripe>
      <el-table-column label="姓名" prop="name"></el-table-column>
      <el-table-column label="电话" prop="phone"></el-table-column>
      <el-table-column label="房间编号" prop="roomCode"></el-table-column>
      <el-table-column label="到店时间" prop="bookTime"></el-table-column>
      <el-table-column label="创建时间" prop="orderTime"></el-table-column>
      <el-table-column label="状态" prop="status">
        <template #default="scope">
          <el-tag v-if="scope.row.status == '1'" size="normal">预订成功</el-tag>
          <el-tag v-if="scope.row.status == '2'" type="success">已入住</el-tag>
          <el-tag v-if="scope.row.status == '3'" type="warning">退房</el-tag>
          <el-tag v-if="scope.row.status == '4'" type="danger">取消</el-tag>
        </template>
      </el-table-column>
      <el-table-column label="创建时间" prop="orderTime"></el-table-column>
      <el-table-column  label="操作" width="150" align="center">
        <template #default="scope">
          <el-button
            v-if="scope.row.status == '1'"
            :icon="Close"
            type="danger"
            size="default"
            @click="cancelBtn(scope.row)"
            >取消预订</el-button
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
</template>

<script setup lang="ts">
import { Search, Close } from "@element-plus/icons-vue";
import useBookTable from "@/composables/order/useBookTable";
//表格
const {
  tableList,
  listParm,
  searchBtn,
  resetBtn,
  sizeChange,
  currentChange,
  tableHeigth,
  cancelBtn,
} = useBookTable();
</script>

<style scoped></style>

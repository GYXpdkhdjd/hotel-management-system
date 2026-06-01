<template>
    <el-main>
        <!-- 搜索栏 -->
        <el-form :model="listParm"  :inline="true" size="small">
            <el-form-item label="标题">
                <el-input v-model="listParm.title"></el-input>
            </el-form-item>
            <el-form-item>
                <el-button :icon="Search" @click="searchBtn">搜索</el-button>
                <el-button :icon="Close" type="danger" plain @click="resetBtn">重置</el-button>
            </el-form-item>
        </el-form>
        <!-- 表格 -->
        <el-table :height="tableHeigth" :data="tableList" border stripe>
            <el-table-column label="标题" prop="title"></el-table-column>
            <el-table-column label="内容" prop="context"></el-table-column>
            <el-table-column label="创建时间" prop="createTime"></el-table-column>
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
        
    </el-main>
    
</template>

<script setup lang="ts">
import { Search,  Close } from "@element-plus/icons-vue";
import useSuggestTable from '@/composables/suggest/useSuggestTable'
//表格
const {tableList,listParm,searchBtn,resetBtn,sizeChange,currentChange,tableHeigth} = useSuggestTable()
</script>

<style scoped>

</style>
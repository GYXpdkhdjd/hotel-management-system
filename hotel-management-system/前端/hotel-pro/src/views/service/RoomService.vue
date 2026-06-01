<template>
    <el-main>
        <!-- 搜索栏 -->
        <el-form :model="listParm" :inline="true" size="default">
            <el-form-item>
                <el-input v-model="listParm.name" placeholder="请输入服务名称"></el-input>
            </el-form-item>
            <el-form-item>
                <el-button :icon="Search" @click="searchBtn">搜索</el-button>
                <el-button :icon="Close" type='danger' plain @click="resetBtn">重置</el-button>
                <el-button v-if="global.$hasPerm(['sys:roomService:add'])" :icon="Plus" type="primary" @click="addBtn">新增</el-button>
            </el-form-item>
        </el-form>
        <!-- 表格 -->
        <el-table :height="tableHeight" :data="tableList.list" border stripe>
            <el-table-column prop="name" label="名称"></el-table-column>
            <el-table-column prop="orderNum" label="序号"></el-table-column>
            <el-table-column v-if="global.$hasPerm(['sys:roomService:edit','sys:roomService:delete'])"  label="操作" align="center" width="200">
                <template #default="scope">
                    <el-button v-if="global.$hasPerm(['sys:roomService:edit'])" :icon="Edit" type="primary" size="default" @click="editBtn(scope.row)">编辑</el-button>
                    <el-button v-if="global.$hasPerm(['sys:roomService:delete'])" :icon="Delete" type="danger" size="default" @click="deleteBtn(scope.row)">删除</el-button>
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
        <AddService ref="addRef" @onRefsh="getList"></AddService>
    </el-main>
    
</template>

<script setup lang="ts">
import AddService from './AddService.vue';
import { Search, Edit, Plus, Close, Delete } from '@element-plus/icons-vue';
import useTable from '@/composables/service/useTable';
import useService from '@/composables/service/useService';
//表格
const {listParm,getList,searchBtn,resetBtn,tableList,sizeChange,currentChange,tableHeight} = useTable()
//新增、编辑
const {addBtn,editBtn,deleteBtn,addRef,global} = useService(getList)
</script>

<style scoped>

</style>
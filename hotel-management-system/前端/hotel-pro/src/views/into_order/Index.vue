<template>
    <el-main>
        <!-- 搜索栏 -->
        <el-form :model="listParm"  :inline="true" size="small">
            <el-form-item label="姓名">
                <el-input v-model="listParm.name"></el-input>
            </el-form-item>
            <el-form-item label="电话">
                <el-input v-model="listParm.phone"></el-input>
            </el-form-item>
            <el-form-item label="身份证">
                <el-input v-model="listParm.idCard"></el-input>
            </el-form-item>
            <el-form-item>
                <el-button :icon="Search" @click="searchBtn">搜索</el-button>
                <el-button :icon="Close" type="danger" plain @click="resetBtn">重置</el-button>
            </el-form-item>
        </el-form>
        <!-- 表格 -->
        <el-table :height="tableHeigth" :data="tableList" border stripe>
            <el-table-column label="姓名" prop="name"></el-table-column>
            <el-table-column label="性别" prop="sex">
                <template #default="scope">
                    <el-tag v-if="scope.row.sex == '0'" type="danger" size="normal"  effect="dark" >男</el-tag>
                    <el-tag v-else size="normal"  effect="dark" >女</el-tag>
                </template>
            </el-table-column>
            <el-table-column label="电话" prop="phone"></el-table-column>
            <el-table-column label="证件类型" prop="cardType"></el-table-column>
            <el-table-column label="证件号码" prop="cardNum"></el-table-column>
            <el-table-column label="房间编号" prop="roomCode"></el-table-column>
            <el-table-column label="入住时间" prop="intoTime"></el-table-column>
            <el-table-column label="退房时间" prop="leaveTime"></el-table-column>
            <el-table-column label="金额" prop="price"></el-table-column>
            <el-table-column label="状态" prop="status">
                <template #default="scope">
                    <el-tag v-if="scope.row.status == '1'" type="danger" size="normal"  effect="dark" >已入住</el-tag>
                    <el-tag v-if="scope.row.status == '2'"  size="normal"  effect="dark" >已退房</el-tag>
                </template>
            </el-table-column>
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
import useIntoOrderTable from '@/composables/order/useIntoOrderTable'
//表格
const {tableList,listParm,searchBtn,resetBtn,sizeChange,currentChange,tableHeigth} = useIntoOrderTable()
</script>

<style scoped>

</style>
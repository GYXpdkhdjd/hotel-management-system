<template>
  <el-main>
    <!--搜索栏 -->
    <el-form :model="listParm" :inline="true" size="default">
      <el-form-item>
        <el-input
          v-model="listParm.infoName"
          placeholder="请输入客房名称"
        ></el-input>
      </el-form-item>
      <el-form-item>
        <el-button :icon="Search" @click="searchBtn">搜索</el-button>
        <el-button :icon="Close" type="danger" plain @click="resetBtn"
          >重置</el-button
        >
        <el-button
          v-if="global.$hasPerm(['sys:hotelRoom:add'])"
          type="primary"
          :icon="Plus"
          @click="addBtn"
          >新增客房</el-button
        >
      </el-form-item>
    </el-form>
    <!-- 表格
    子表格的关键：
    1、给父表格添加一列 el-table-column，并且要加上 type="expand"
    2、父表格需要加上 row-key="infoId"
    3、子表显示：通常插槽的形式显示  <template #default="scope">
    -->
    <el-table
      ref="tableRef"
      row-key="infoId"
      @expand-change="openChange"
      :height="tableHeight"
      :data="tableList"
      border
      stripe
    >
      <el-table-column type="expand">
        <template #default="scope">
          <el-table :data="scope.row.roomList" border stripe>
            <el-table-column prop="roomCode" label="房间编号"></el-table-column>
            <el-table-column prop="useStatus" label="状态">
              <template #default="props">
                <el-tag size="default">{{
                  status[props.row.bookStatus]
                }}</el-tag>
              </template>
            </el-table-column>
            <el-table-column width="500" align="center">
              <template #default="props">
                <el-button
                  :icon="Edit"
                  type="primary"
                  size="default"
                  @click="editRoomBtn(props.row)"
                  >编辑</el-button
                >
                <el-button
                  :icon="Edit"
                  type="info"
                  size="default"
                  @click="repairRoomBtn(props.row)"
                  >维修</el-button
                >
                <el-button
                  :icon="Edit"
                  type="success"
                  size="default"
                  @click="startRoomBtn(props.row)"
                  >启用</el-button
                >
                <el-button
                  :icon="Edit"
                  type="warning"
                  size="default"
                  @click="stopRoomBtn(props.row)"
                  >停用</el-button
                >
                <el-button
                  :icon="Delete"
                  type="danger"
                  size="default"
                  @click="roomDeleteBtn(props.row)"
                  >删除</el-button
                >
              </template>
            </el-table-column>
          </el-table>
        </template>
      </el-table-column>
      <el-table-column prop="image" width="90" label="图片" align="center">
        <template #default="scope">
          <el-image
            style="width: 60px; height: 60px; border-radius: 50%"
            :src="scope.row.imgUrl.split(',')[0]"
          ></el-image>
        </template>
      </el-table-column>
      <el-table-column prop="infoName" label="客房名称"></el-table-column>
      <el-table-column prop="typeName" label="客房类型"></el-table-column>
      <el-table-column prop="infoPrice" label="价格"></el-table-column>
      <el-table-column prop="infoBed" label="床位"></el-table-column>
      <el-table-column prop="infoCount" label="可住人数"></el-table-column>
      <el-table-column prop="orderNum" label="序号"></el-table-column>
      <el-table-column align="center" label="设为热推" show-overflow-tooltip>
        <template #default="{ row }">
          <el-switch
            v-model="row.toIndex"
            active-color="#1890FF"
            inactive-color="#A9A8A8"
            @change="setHotBtn(row)"
          />
        </template>
      </el-table-column>
      <el-table-column align="center" label="启用" show-overflow-tooltip>
        <template #default="{ row }">
          <el-switch
            v-model="row.infoStatus"
            active-color="#1890FF"
            inactive-color="#A9A8A8"
            @change="turnBtn(row)"
          />
        </template>
      </el-table-column>
      <el-table-column v-if="global.$hasPerm(['sys:hotelRoom:edit','sys:hotelRoom:addRoom','sys:hotelRoom:delete'])" label="操作" width="320" align="center">
        <template #default="scope">
          <el-button
            v-if="global.$hasPerm(['sys:hotelRoom:edit'])"
            :icon="Edit"
            type="primary"
            size="default"
            @click="editBtn(scope.row)"
            >编辑</el-button
          >
          <el-button
            v-if="global.$hasPerm(['sys:hotelRoom:addRoom'])"
            :icon="Edit"
            type="success"
            size="default"
            @click="addRoomBtn(scope.row)"
            >新增房间</el-button
          >
          <el-button
            v-if="global.$hasPerm(['sys:hotelRoom:delete'])"
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

    <!-- 新增 -->
    <AddHotel ref="addRef" @onRefsh="getList"></AddHotel>
    <!-- 新增房间 -->
    <AddRoom ref="addRoom" @onFresh="(infoId) => getRoomList(infoId)"></AddRoom>
  </el-main>
</template>

<script setup lang="ts">
import AddHotel from "./AddHotel.vue";
import AddRoom from "./AddRoom.vue";
import { Search, Edit, Plus, Close, Delete } from "@element-plus/icons-vue";
import useHotelTable from "@/composables/hotel_info/useHotelTable";
import useHotelInfo from "@/composables/hotel_info/useHotelInfo";
import useExpandTable from "@/composables/hotel_info/useExpandTable";
import { ref } from "vue";
import { ElTable } from "element-plus";
//表格的ref属性
const tableRef = ref<InstanceType<typeof ElTable>>();
//状态
const status = ["未使用", "已预订", "已入住", "维修中", "停用"];
//表格
const {
  listParm,
  searchBtn,
  resetBtn,
  getList,
  tableList,
  sizeChange,
  currentChange,
  tableHeight,
} = useHotelTable();
//增删改
const {
  addBtn,
  editBtn,
  deleteBtn,
  addRef,
  addRoomBtn,
  addRoom,
  turnBtn,
  setHotBtn,
  global,
} = useHotelInfo(getList);
//子表的操作
const {
  getRoomList,
  editRoomBtn,
  repairRoomBtn,
  startRoomBtn,
  stopRoomBtn,
  roomDeleteBtn,
  openChange,
} = useExpandTable(tableRef, addRoom);
</script>

<style scoped></style>

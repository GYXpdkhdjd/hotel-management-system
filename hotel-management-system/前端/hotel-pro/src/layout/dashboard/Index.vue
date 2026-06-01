<template>
  <el-container class="container" :style="{ height: height + 'px' }">
    <el-container>
      <el-header class="header" :style="{ height: headerHeight }">
        <div style="display: flex; margin: 15px 0px">
          <div
            :class="{ active: currentIndex === index }"
            @click="itemClick(index, item)"
            class="item"
            v-for="(item, index) in category"
            :key="index"
          >
            {{ item.label }}
          </div>
        </div>
        <el-form
          style="border-bottom: 1px solid #efefef"
          :model="roomParm"
          :inline="true"
          size="small"
        >
          <el-form-item style="margin-bottom: 10px" label="房间编号">
            <el-input v-model="roomParm.roomCode"></el-input>
          </el-form-item>
          <el-form-item style="margin-bottom: 10px" label="状态">
            <el-select v-model="roomParm.bookStatus" placeholder="请选择状态">
              <el-option label="未入住" value="0" />
              <el-option label="已预订" value="1" />
              <el-option label="已入住" value="2" />
              <el-option label="维修中" value="3" />
              <el-option label="停用" value="4" />
            </el-select>
          </el-form-item>
          <el-form-item style="margin-bottom: 10px">
            <el-button :icon="Search" @click="getRoomList">搜索</el-button>
            <el-button type="danger" @click="resetBtn" plain :icon="Close"
              >重置</el-button
            >
            <el-button :icon="Refresh" @click="getRoomList">刷新</el-button>
          </el-form-item>
        </el-form>
      </el-header>
      <el-main class="main" style="padding: 10px 20px">
        <!-- 房间列表 -->
        <div class="roomList">
          <div
            style="position: relative"
            v-for="(item, index) in roomList"
            :key="index"
            :class="{
              item: item['bookStatus'] == '0',
              bookitem: item['bookStatus'] == '1',
              useitem: item['bookStatus'] == '2',
              repairitem: item['bookStatus'] == '3',
              stopitem: item['bookStatus'] == '4',
            }"
          >
            <div>{{ item["infoName"] }}</div>
            <div style="display: flex">
              <div style="font-weight: 600; margin: 6px 0px">
                {{ item["roomCode"] }}
              </div>
              <div style="font-weight: 600; margin: 6px 0px 6px 6px">
                {{ item["name"] }}
              </div>
            </div>
            <div>{{ status[item["bookStatus"]] }}</div>
            <el-icon
              @click="openInfo(item)"
              style="
                position: absolute;
                right: 6px;
                bottom: 6px;
                font-size: 18px;
              "
            >
              <EditPen />
            </el-icon>
          </div>
        </div>
      </el-main>
    </el-container>
    <el-aside class="asside" width="200px">
      <el-divider style="margin-bottom: 35px" content-position="left"
        >颜色状态</el-divider
      >
      <div class="items">
        <div class="noitem"></div>
        <div class="item-text">空房</div>
      </div>
      <div class="items">
        <div class="bookitem"></div>
        <div class="item-text">已预订</div>
      </div>
      <div class="items">
        <div class="hasitem"></div>
        <div class="item-text">已入住</div>
      </div>
      <div class="items">
        <div class="repiritem"></div>
        <div class="item-text">维修中</div>
      </div>
      <div class="items">
        <div class="stopitem"></div>
        <div class="item-text">停用</div>
      </div>
      <el-divider
        style="margin-top: 60px; margin-bottom: 35px"
        content-position="left"
        >房间总数：{{ total.totalCount }}</el-divider
      >
      <div class="total">
        <div>空房：</div>
        <div>{{ total.noBookCount }}</div>
      </div>
      <div class="total">
        <div style="color: deepskyblue">已预订：</div>
        <div>{{ total.hasBookCount }}</div>
      </div>
      <div class="total">
        <div style="color: mediumseagreen">已入住：</div>
        <div>{{ total.hasIntoCount }}</div>
      </div>
      <div class="total">
        <div style="color: blueviolet">维修中：</div>
        <div>{{ total.hasRepirCount }}</div>
      </div>
      <div class="total">
        <div style="color: #ff7670">停用：</div>
        <div>{{ total.hasStopCount }}</div>
      </div>
    </el-aside>
  </el-container>
  <!-- 空房信息录入弹框 -->
  <AddOrder ref="addRef" @onRefsh="reFresh"></AddOrder>
  <!-- 退房 -->
  <CheckOut ref="checkRef" @onRefsh="reFresh"></CheckOut>
</template>

<script setup lang="ts">
import AddOrder from "./AddOrder.vue";
import CheckOut from "./CheckOut.vue";
import { Search, Close, Refresh } from "@element-plus/icons-vue";
import { onMounted, reactive, ref } from "vue";
import { getRoomListApi, upRoomApi, getTotalApi } from "@/api/home/index";
import useCategory from "@/composables/home/useCategory";
import { SelectType } from "@/api/user/UserModel";
import useInstance from "@/hooks/useInstance";
import { ElMessage } from "element-plus";
const { global } = useInstance();
//退房弹框ref属性
const checkRef = ref<{ show: (roomId: string) => void }>();
//信息录入弹框ref属性
const addRef = ref<{
  show: (roomId: string, roomCode: string, status: string) => void;
}>();
//头部高度
const headerHeight = ref("100px");
//状态
const status = ["空房", "已预订", "已入住", "维修中", "停用"];
//分类
const { height, category, currentIndex } = useCategory();
//房间列表
const roomList = ref([]);
//列表查询的参数
const roomParm = reactive({
  typeId: "",
  roomCode: "",
  bookStatus: "",
  useStatus: "",
});
//列表查询
const getRoomList = async () => {
  let res = await getRoomListApi(roomParm);
  console.log(res);
  if (res && res.code == 200) {
    roomList.value = res.data;
  }
};
//分类按钮点击事件
const itemClick = (index: number, item: SelectType) => {
  currentIndex.value = index;
  //获取列表
  console.log(item);
  roomParm.typeId = item.value;
  getRoomList();
};
const reFresh = ()=>{
  getRoomList()
  getTotal();
}
//重置
const resetBtn = () => {
  roomParm.bookStatus = "";
  roomParm.roomCode = "";
  roomParm.typeId = "";
  currentIndex.value = 0;
  getRoomList();
};
//图标点击事件
const openInfo = async (item: any) => {
  console.log(item);
  if (item.bookStatus == "0" || item.bookStatus == "1") {
    //办理入住
    addRef.value?.show(item.roomId, item.roomCode, item.bookStatus);
  } else if (item.bookStatus == "2") {
    //退房
    checkRef.value?.show(item.roomId);
  } else if (item.bookStatus == "3") {
    //维修中
    const confirm = await global.$myconfirm("确定该房间已经维修完成吗？");
    if (confirm) {
      let res = await upRoomApi(item.roomId);
      if (res && res.code == 200) {
        ElMessage.success(res.msg);
        getRoomList();
        getTotal();
      }
    }
  } else if (item.bookStatus == "4") {
    //停用
    //维修中
    const confirm = await global.$myconfirm("确定启用该房间吗？");
    if (confirm) {
      let res = await upRoomApi(item.roomId);
      if (res && res.code == 200) {
        ElMessage.success(res.msg);
        getRoomList();
        getTotal();
      }
    }
  }
};
//统计
const total = reactive({
  noBookCount: 0,
  hasBookCount: 0,
  hasIntoCount: 0,
  hasRepirCount: 0,
  hasStopCount: 0,
  totalCount: 0,
});
const getTotal = async () => {
  let res = await getTotalApi();
  if (res && res.code == 200) {
    console.log(res.data);
    Object.assign(total, res.data);
  }
};
onMounted(() => {
  getRoomList();
  getTotal();
  window.onresize = () => {
    return (() => {
      if (document.body.clientWidth < 1450) {
        headerHeight.value = "140px";
      } else {
        headerHeight.value = "90px";
      }
    })();
  };
});
</script>

<style lang="scss" scoped>
.container {
  .header {
    // background: chocolate;
    border-bottom: 1px solid #efefef;
    // height: 90px;
    display: flex;
    // align-items: center;
    flex-direction: column;
    .item {
      margin-right: 15px;
      color: black;
      cursor: pointer;
      border: 1px solid #dedfe0;
      padding: 5px 10px;
      font-size: 12px;
      border-radius: 5px;
    }
    .active {
      margin-right: 15px;
      color: #fff;
      cursor: pointer;
      background-color: #409eff;
      padding: 5px 10px;
      font-size: 12px;
      border-radius: 5px;
    }
  }
  .asside {
    padding: 15px 20px;
    // background: yellowgreen;
    border-left: 1px solid #efefef;
    .items {
      display: flex;
      align-items: center;
      margin-bottom: 20px;
      .noitem {
        border: 1px solid #dedfe0;
        background-color: #f5f7fa;
        height: 25px;
        width: 50px;
        border-radius: 5px;
      }
      .hasitem {
        border: 1px solid #dedfe0;
        background-color: mediumseagreen;
        height: 25px;
        width: 50px;
        border-radius: 5px;
      }
      .bookitem {
        border: 1px solid #dedfe0;
        background-color: deepskyblue;
        height: 25px;
        width: 50px;
        border-radius: 5px;
      }
      .repiritem {
        border: 1px solid #dedfe0;
        background-color: blueviolet;
        height: 25px;
        width: 50px;
        border-radius: 5px;
      }
      .stopitem {
        border: 1px solid #dedfe0;
        background-color: #ff7670;
        height: 25px;
        width: 50px;
        border-radius: 5px;
      }
      .item-text {
        font-size: 12px;
        font-weight: bold;
        margin-left: 15px;
      }
    }
    .total {
      display: flex;
      align-items: center;
      margin-bottom: 20px;
      font-weight: bold;
      font-size: 14px;
    }
  }
}
.roomList {
  display: flex;
  flex-wrap: wrap;
  font-size: 12px;
  .item {
    border: 1px solid #dedfe0;
    margin: 10px;
    border-radius: 7px;
    background-color: #f5f7fa;
    width: 150px;
    height: 85px;
    cursor: pointer;
    display: flex;
    align-items: center;
    justify-content: center;
    flex-direction: column;
  }
  .useitem {
    border: 1px solid #dedfe0;
    margin: 10px;
    border-radius: 7px;
    background-color: mediumseagreen;
    width: 150px;
    height: 85px;
    color: #fff;
    cursor: pointer;
    display: flex;
    align-items: center;
    justify-content: center;
    flex-direction: column;
  }
  .bookitem {
    border: 1px solid #dedfe0;
    margin: 10px;
    border-radius: 7px;
    background-color: deepskyblue;
    width: 150px;
    height: 85px;
    color: #fff;
    cursor: pointer;
    display: flex;
    align-items: center;
    justify-content: center;
    flex-direction: column;
  }
  .repairitem {
    border: 1px solid #dedfe0;
    margin: 10px;
    border-radius: 7px;
    background-color: blueviolet;
    width: 150px;
    height: 85px;
    color: #fff;
    cursor: pointer;
    display: flex;
    align-items: center;
    justify-content: center;
    flex-direction: column;
  }
  .stopitem {
    border: 1px solid #dedfe0;
    margin: 10px;
    border-radius: 7px;
    background-color: #ff7670;
    width: 150px;
    height: 85px;
    color: #fff;
    cursor: pointer;
    display: flex;
    align-items: center;
    justify-content: center;
    flex-direction: column;
  }
}
:deep(.el-divider__text){
  font-weight: bold!important;
}
</style>

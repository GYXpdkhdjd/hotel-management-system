<template>
  <menu-logo :isCollapsed="isCollapse"></menu-logo>
  <el-menu
    :default-active="activeIndex"
    class="el-menu-vertical-demo"
    unique-opened
    background-color="#304156"
    router
    :collapse="isCollapse"
  >
    <menu-item :menuList="menuList"></menu-item>
  </el-menu>
</template>

<script setup lang="ts">
import { computed, reactive } from "vue";
import MenuItem from "@/layout/menu/MenuItem.vue";
import MenuLogo from "@/layout/menu/MenuLogo.vue";
import { useRoute } from "vue-router";
import { collapseStore } from "@/store/collapse/index";
import { menuStore } from "@/store/menu";
const colstore = collapseStore()
const mstore = menuStore()
const isCollapse = computed(()=>{
  return colstore.getCollapse
})
//当前路由
const route = useRoute();
//当前激活的菜单项
const activeIndex = computed(() => {
  const { path } = route;
  return path;
});
const menuList = computed(()=>{
  return mstore.menuList
})
// reactive:定义响应式的数据，复杂类型
// ref ： 定义响应式的数据 ，基本类型数据
// let menuList = reactive([
//   {
//     path: "/dashboard",
//     component: "Layout",
//     name: "dashboard",
//     meta: {
//       title: "首页",
//       icon: "HomeFilled",
//       roles: ["sys:dashboard"],
//     },
//   },
//   {
//     path: "/system",
//     component: "Layout",
//     name: "system",
//     meta: {
//       title: "系统管理",
//       icon: "Setting",
//       roles: ["sys:manage"],
//     },
//     children: [
//       {
//         path: "/userList",
//         component: "/system/user/UserList",
//         name: "userList",
//         meta: {
//           title: "员工管理",
//           icon: "UserFilled",
//           roles: ["sys:user"],
//         },
//       },
//       {
//         path: "/roleList",
//         component: "/system/role/RoleList",
//         name: "roleList",
//         meta: {
//           title: "角色管理",
//           icon: "Wallet",
//           roles: ["sys:role"],
//         },
//       },
//       {
//         path: "/menuList",
//         component: "/system/menu/MenuList",
//         name: "menuList",
//         meta: {
//           title: "菜单管理",
//           icon: "Menu",
//           roles: ["sys:menu"],
//         },
//       },
//     ],
//   },
//   {
//     path: "/totelRoot",
//     component: "Layout",
//     name: "totelRoot",
//     meta: {
//       title: "酒店管理",
//       icon: "Menu",
//       roles: ["sys:totelRoot"],
//     },
//     children: [
//       {
//         path: "/roomService",
//         component: "/service/RoomService",
//         name: "roomService",
//         meta: {
//           title: "服务管理",
//           icon: "UserFilled",
//           roles: ["sys:roomService"],
//         },
//       },
//       {
//         path: "/roomType",
//         component: "/type/RoomType",
//         name: "roomType",
//         meta: {
//           title: "房间类型",
//           icon: "UserFilled",
//           roles: ["sys:roomType"],
//         },
//       },
//       {
//         path: "/hotelRoom",
//         component: "/hotel/HotelRoom",
//         name: "hotelRoom",
//         meta: {
//           title: "房间管理",
//           icon: "Menu",
//           roles: ["sys:hotelRoom"],
//         },
//       },
//     ],
//   },
//   {
//     path: "/activityRoot",
//     component: "Layout",
//     name: "activityRoot",
//     meta: {
//       title: "活动管理",
//       icon: "UserFilled",
//       roles: ["sys:activityRoot"],
//     },
//     children: [
//       {
//         path: "/banner",
//         component: "/banner/Banner",
//         name: "banner",
//         meta: {
//           title: "广告管理",
//           icon: "Menu",
//           roles: ["sys:banner"],
//         },
//       }
//     ],
//   },
//   {
//     path: "/orderRoot",
//     component: "Layout",
//     name: "orderRoot",
//     meta: {
//       title: "订单管理",
//       icon: "UserFilled",
//       roles: ["sys:orderRoot"],
//     },
//     children: [
//       {
//         path: "/intoOrder",
//         component: "/into_order/Index",
//         name: "intoOrder",
//         meta: {
//           title: "入住订单",
//           icon: "Menu",
//           roles: ["sys:intoOrder"],
//         },
//       },
//       {
//         path: "/bookOrder",
//         component: "/book_order/Index",
//         name: "bookOrder",
//         meta: {
//           title: "预订订单",
//           icon: "Menu",
//           roles: ["sys:bookOrder"],
//         },
//       }
//     ],
//   },
//   {
//     path: "/suggestRoot",
//     component: "Layout",
//     name: "suggestRoot",
//     meta: {
//       title: "反馈管理",
//       icon: "UserFilled",
//       roles: ["sys:suggestRoot"],
//     },
//     children: [
//       {
//         path: "/suggest",
//         component: "/suggest/Index",
//         name: "suggest",
//         meta: {
//           title: "反馈列表",
//           icon: "Menu",
//           roles: ["sys:suggest"],
//         },
//       }
//     ]
//   }
// ]);
</script>

<style scoped lang="scss">
.el-menu-vertical-demo:not(.el-menu--collapse) {
  width: 230px;
  min-height: 400px;
}
.el-menu {
  border-right: none;
}

:deep(.el-sub-menu .el-sub-menu__title) {
  color: #f4f4f5 !important;
}

:deep(.el-menu .el-menu-item) {
  color: #bfcbd9;
}
/* 菜单点中文字的颜色 */

:deep(.el-menu-item.is-active) {
  color: #409eff !important;
}
/* 当前打开菜单的所有子菜单颜色 */

:deep(.is-opened .el-menu-item) {
  background-color: #1f2d3d !important;
}
/* 鼠标移动菜单的颜色 */

:deep(.el-menu-item:hover) {
  background-color: #001528 !important;
}
</style>

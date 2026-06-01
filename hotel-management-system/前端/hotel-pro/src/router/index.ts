import { createRouter, createWebHistory, RouteRecordRaw } from 'vue-router'
import Layout from '@/layout/Index.vue'
//无需权限就可以访问
export const constantRoutes: Array<RouteRecordRaw> = [
  {
    path: "/login",
    component: () => import('@/views/login/Index.vue'),
    name: "login"
  },
  {
    path: '/',
    component: Layout,
    redirect: '/dashboard',
    children: [
      {
        path: '/dashboard',
        component: () => import('@/layout/dashboard/Index.vue'),
        name: 'dashboard',
        meta: {
          title: '首页',
          icon: '#icondashboard'
        }
      }
    ]
  }
]
//需要权限访问
const routes: Array<RouteRecordRaw> = [
  {
    path: "/login",
    component: () => import('@/views/login/Index.vue'),
    name: "login"
  },
  {
    path: '/',
    component: Layout,
    redirect: '/dashboard',
    children: [
      {
        path: '/dashboard',
        component: () => import('@/layout/dashboard/Index.vue'),
        name: 'dashboard',
        meta: {
          title: '首页',
          icon: '#icondashboard'
        }
      }
    ]
  },
  {
    path: "/system",
    component: Layout,
    name: "system",
    meta: {
      title: "系统管理",
      icon: "el-icon-menu",
      roles: ["sys:system"]
    },
    children: [
      {
        path: "/userList",
        component: () => import('@/views/system/user/UserList.vue'),
        name: "userList",
        meta: {
          title: "员工管理",
          icon: "el-icon-s-custom",
          roles: ["sys:user"]
        },
      },
      {
        path: "/roleList",
        component: () => import('@/views/system/role/RoleList.vue'),
        name: "roleList",
        meta: {
          title: "角色管理",
          icon: "el-icon-s-tools",
          roles: ["sys:role"]
        },
      },
      {
        path: "/menuList",
        component: () => import('@/views/system/menu/MenuList.vue'),
        name: "menuList",
        meta: {
          title: "权限管理",
          icon: "el-icon-document",
          roles: ["sys:menu"]
        },
      },
    ]
  },
  {
    path: "/totelRoot",
    component: Layout,
    name: "totelRoot",
    meta: {
      title: "酒店管理",
      icon: "Setting",
      roles: ["sys:totelRoot"],
    },
    children: [
      {
        path: "/roomService",
        component: () => import('@/views/service/RoomService.vue'),
        name: "roomService",
        meta: {
          title: "服务管理",
          icon: "Wallet",
          roles: ["sys:roomService"],
        }
      },
      {
        path: "/roomType",
        component: () => import('@/views/type/RoomType.vue'),
        name: "roomType",
        meta: {
          title: "房间类型",
          icon: "UserFilled",
          roles: ["sys:roomType"],
        },
      },
      {
        path: "/hotelRoom",
        component: () => import('@/views/hotel/HotelRoom.vue'),
        name: "hotelRoom",
        meta: {
          title: "房间管理",
          icon: "Menu",
          roles: ["sys:hotelRoom"],
        },
      }
    ]
  },
  {
    path: "/activityRoot",
    component: Layout,
    name: "activityRoot",
    meta: {
      title: "活动管理",
      icon: "Menu",
      roles: ["sys:activityRoot"],
    },
    children: [
      {
        path: "/banner",
        component: () => import('@/views/banner/Banner.vue'),
        name: "banner",
        meta: {
          title: "广告管理",
          icon: "Wallet",
          roles: ["sys:banner"],
        }
      }
    ]
  },
  {
    path: "/orderRoot",
    component: Layout,
    name: "orderRoot",
    meta: {
      title: "订单管理",
      icon: "Menu",
      roles: ["sys:orderRoot"],
    },
    children: [
      {
        path: "/intoOrder",
        component: () => import('@/views/into_order/Index.vue'),
        name: "intoOrder",
        meta: {
          title: "入住订单",
          icon: "Wallet",
          roles: ["sys:intoOrder"],
        }
      },
      {
        path: "/bookOrder",
        component: () => import('@/views/book_order/Index.vue'),
        name: "bookOrder",
        meta: {
          title: "预订订单",
          icon: "Wallet",
          roles: ["sys:bookOrder"],
        }
      }
    ]
  },
  {
    path: "/suggestRoot",
    component: Layout,
    name: "suggestRoot",
    meta: {
      title: "反馈管理",
      icon: "Menu",
      roles: ["sys:suggestRoot"],
    },
    children: [
      {
        path: "/suggest",
        component: () => import('@/views/suggest/Index.vue'),
        name: "suggest",
        meta: {
          title: "反馈列表",
          icon: "Wallet",
          roles: ["sys:suggest"],
        }
      }
    ]
  }
]

const router = createRouter({
  history: createWebHistory(),
  routes:constantRoutes
})

export default router
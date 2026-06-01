"use strict";
var common_vendor = require("../../common/vendor.js");
var api_home = require("../../api/home.js");
require("../../common/http.js");
if (!Array) {
  const _easycom_u_tabs_swiper2 = common_vendor.resolveComponent("u-tabs-swiper");
  const _easycom_u_icon2 = common_vendor.resolveComponent("u-icon");
  const _easycom_u_loadmore2 = common_vendor.resolveComponent("u-loadmore");
  (_easycom_u_tabs_swiper2 + _easycom_u_icon2 + _easycom_u_loadmore2)();
}
const _easycom_u_tabs_swiper = () => "../../uni_modules/vk-uview-ui/components/u-tabs-swiper/u-tabs-swiper.js";
const _easycom_u_icon = () => "../../uni_modules/vk-uview-ui/components/u-icon/u-icon.js";
const _easycom_u_loadmore = () => "../../uni_modules/vk-uview-ui/components/u-loadmore/u-loadmore.js";
if (!Math) {
  (_easycom_u_tabs_swiper + _easycom_u_icon + _easycom_u_loadmore)();
}
const _sfc_main = {
  __name: "order",
  setup(__props) {
    const tabs = common_vendor.ref(null);
    const list = common_vendor.ref([
      {
        name: "\u5168\u90E8"
      },
      {
        name: "\u5DF2\u9884\u8BA2"
      },
      {
        name: "\u5DF2\u5165\u4F4F"
      },
      {
        name: "\u5DF2\u9000\u623F"
      }
    ]);
    const orderList = common_vendor.ref([
      [],
      [],
      [],
      []
    ]);
    common_vendor.ref([{
      orderId: 1,
      infoName: "\u6807\u51C6\u5355\u4EBA\u95F4",
      deal: "\u9884\u8BA2\u6210\u529F",
      imgUrl: "/static/swiper1.png",
      roomCode: "101,102",
      name: "\u5F20\u4E09",
      phone: "18787171906",
      bookTime: "2022-09-15"
    }, {
      orderId: 2,
      infoName: "\u6807\u51C6\u53CC\u4EBA\u95F4",
      deal: "\u9884\u8BA2\u6210\u529F",
      imgUrl: "/static/swiper2.png",
      roomCode: "201,202",
      name: "\u674E\u56DB",
      phone: "18787171906",
      bookTime: "2022-09-15"
    }]);
    const status = common_vendor.ref(["\u9884\u8BA2\u6210\u529F", "\u5DF2\u5165\u4F4F", "\u9000\u623F"]);
    const currents = common_vendor.ref(0);
    const swiperCurrent = common_vendor.ref(0);
    common_vendor.ref(0);
    common_vendor.ref(0);
    const pageSize = common_vendor.ref(3);
    const currentPage = common_vendor.ref(1);
    const pages = common_vendor.ref(0);
    const loadStatus = common_vendor.ref(["loadmore", "loadmore", "loadmore", "loadmore"]);
    const reachBottom = () => {
      loadStatus.value.splice(currents.value, 1, "loading");
      setTimeout(() => {
        if (currentPage.value < pages.value) {
          currentPage.value = ++currentPage.value;
          getOrderList(currents.value);
        } else {
          loadStatus.value.splice(currents.value, 1, "nomore");
        }
      }, 500);
    };
    const change = (index) => {
      loadStatus.value.splice(index, 1, "loading");
      currentPage.value = 1;
      pages.value = 0;
      orderList.value[currents.value] = [];
      swiperCurrent.value = index;
    };
    const transition = ({ detail: { dx } }) => {
      tabs.value.setDx(dx);
    };
    const animationfinish = ({ detail: { current } }) => {
      console.log("\u6ED1\u52A8");
      tabs.value.setFinishCurrent(current);
      swiperCurrent.value = current;
      currents.value = current;
      currentPage.value = 1;
      pages.value = 0;
      orderList.value[currents.value] = [];
      getOrderList(current);
    };
    const getOrderList = async (idx) => {
      let res = await api_home.getOrderListApi({
        openid: common_vendor.index.getStorageSync("openid"),
        type: idx == 0 ? "" : idx,
        currentPage: currentPage.value,
        pageSize: pageSize.value
      });
      if (res && res.code == 200) {
        if (res.data.records.length == 0) {
          loadStatus.value.splice(idx, 1, "nomore");
          return;
        }
        pages.value = res.data.pages;
        res.data.records.map((item) => {
          orderList.value[idx].push(item);
        });
      }
      loadStatus.value.splice(currents.value, 1, "loadmore");
    };
    common_vendor.onReady(() => {
      getOrderList(currents.value);
    });
    return (_ctx, _cache) => {
      return {
        a: common_vendor.sr(tabs, "59b7fbf9-0", {
          "k": "tabs"
        }),
        b: common_vendor.o(change),
        c: common_vendor.p({
          activeColor: "#f29100",
          list: list.value,
          current: currents.value,
          ["is-scroll"]: false,
          swiperWidth: "750"
        }),
        d: common_vendor.f(list.value, (item, index, i0) => {
          return {
            a: common_vendor.f(orderList.value[index], (res, index1, i1) => {
              return {
                a: "59b7fbf9-1-" + i0 + "-" + i1,
                b: common_vendor.t(res.infoName),
                c: "59b7fbf9-2-" + i0 + "-" + i1,
                d: common_vendor.t(status.value[res.status - 1]),
                e: res.imgUrl.split(",")[0],
                f: common_vendor.t(res.name),
                g: common_vendor.t(res.phone),
                h: common_vendor.t(res.roomCode),
                i: common_vendor.t(res.bookTime),
                j: res.orderId
              };
            }),
            b: "59b7fbf9-3-" + i0,
            c: common_vendor.p({
              status: loadStatus.value[index],
              bgColor: "#f2f2f2"
            }),
            d: index
          };
        }),
        e: common_vendor.p({
          name: "home",
          size: 30,
          color: "rgb(94,94,94)"
        }),
        f: common_vendor.p({
          name: "arrow-right",
          color: "rgb(203,203,203)",
          size: 26
        }),
        g: common_vendor.o(reachBottom),
        h: swiperCurrent.value,
        i: common_vendor.o(transition),
        j: common_vendor.o(animationfinish)
      };
    };
  }
};
var MiniProgramPage = /* @__PURE__ */ common_vendor._export_sfc(_sfc_main, [["__scopeId", "data-v-59b7fbf9"], ["__file", "D:/gitSpace/hotel-management-system/\u5C0F\u7A0B\u5E8F/wx-hotel/src/pages/order/order.vue"]]);
wx.createPage(MiniProgramPage);

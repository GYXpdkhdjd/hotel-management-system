"use strict";
var common_vendor = require("../../common/vendor.js");
var api_home = require("../../api/home.js");
require("../../common/http.js");
if (!Array) {
  const _easycom_u_divider2 = common_vendor.resolveComponent("u-divider");
  const _easycom_u_lazy_load2 = common_vendor.resolveComponent("u-lazy-load");
  const _easycom_u_waterfall2 = common_vendor.resolveComponent("u-waterfall");
  (_easycom_u_divider2 + _easycom_u_lazy_load2 + _easycom_u_waterfall2)();
}
const _easycom_u_divider = () => "../../uni_modules/vk-uview-ui/components/u-divider/u-divider.js";
const _easycom_u_lazy_load = () => "../../uni_modules/vk-uview-ui/components/u-lazy-load/u-lazy-load.js";
const _easycom_u_waterfall = () => "../../uni_modules/vk-uview-ui/components/u-waterfall/u-waterfall.js";
if (!Math) {
  (_easycom_u_divider + _easycom_u_lazy_load + _easycom_u_waterfall)();
}
const _sfc_main = {
  __name: "index",
  setup(__props) {
    const indicatorDots = common_vendor.ref(true);
    const autoplay = common_vendor.ref(true);
    const interval = common_vendor.ref(2e3);
    const duration = common_vendor.ref(500);
    const swipperList = common_vendor.ref([]);
    const getSwapperList = async () => {
      let { data } = await api_home.getSwapperListApi();
      console.log(data);
      swipperList.value = data;
    };
    const flowList = common_vendor.reactive({
      list: []
    });
    const getHotList = async () => {
      let { data } = await api_home.getHotListApi();
      console.log(data);
      flowList.list = data;
    };
    const toDetails = (infoId) => {
      common_vendor.index.navigateTo({
        url: "../details/details?infoId=" + infoId
      });
    };
    common_vendor.onLoad(() => {
      getSwapperList();
      getHotList();
    });
    return (_ctx, _cache) => {
      return {
        a: common_vendor.f(swipperList.value, (item, index, i0) => {
          return {
            a: item.images,
            b: common_vendor.o(($event) => toDetails(item.infoId), index),
            c: index
          };
        }),
        b: indicatorDots.value,
        c: autoplay.value,
        d: interval.value,
        e: duration.value,
        f: common_vendor.p({
          color: "#fa3534"
        }),
        g: common_vendor.w(({
          leftList
        }, s0, i0) => {
          return {
            a: common_vendor.f(leftList, (item, index, i1) => {
              return {
                a: "1badc801-2-" + i0 + "-" + i1 + ",1badc801-1",
                b: common_vendor.p({
                  threshold: "-450",
                  ["border-radius"]: "10",
                  image: item.imgUrl.split(",")[0],
                  index
                }),
                c: common_vendor.t(item.infoName),
                d: common_vendor.t(item.infoPrice),
                e: common_vendor.o(($event) => toDetails(item.infoId), index),
                f: index
              };
            }),
            b: i0,
            c: s0
          };
        }, {
          name: "left",
          path: "g",
          vueId: "1badc801-1"
        }),
        h: common_vendor.w(({
          rightList
        }, s0, i0) => {
          return {
            a: common_vendor.f(rightList, (item, index, i1) => {
              return {
                a: "1badc801-3-" + i0 + "-" + i1 + ",1badc801-1",
                b: common_vendor.p({
                  threshold: "-450",
                  ["border-radius"]: "10",
                  image: item.imgUrl.split(",")[0],
                  index
                }),
                c: common_vendor.t(item.infoName),
                d: common_vendor.t(item.infoPrice),
                e: common_vendor.o(($event) => toDetails(item.infoId), index),
                f: index
              };
            }),
            b: i0,
            c: s0
          };
        }, {
          name: "right",
          path: "h",
          vueId: "1badc801-1"
        }),
        i: common_vendor.sr("uWaterfall", "1badc801-1"),
        j: common_vendor.o(($event) => flowList.list = $event),
        k: common_vendor.p({
          modelValue: flowList.list
        })
      };
    };
  }
};
var MiniProgramPage = /* @__PURE__ */ common_vendor._export_sfc(_sfc_main, [["__scopeId", "data-v-1badc801"], ["__file", "D:/gitSpace/hotel-management-system/\u5C0F\u7A0B\u5E8F/wx-hotel/src/pages/index/index.vue"]]);
wx.createPage(MiniProgramPage);

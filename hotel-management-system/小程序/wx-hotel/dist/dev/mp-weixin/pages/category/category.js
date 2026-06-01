"use strict";
var common_vendor = require("../../common/vendor.js");
var api_category = require("../../api/category.js");
require("../../common/http.js");
const _sfc_main = {
  __name: "category",
  setup(__props) {
    const instance = common_vendor.getCurrentInstance();
    const scrollTop = common_vendor.ref(0);
    const oldScrollTop = common_vendor.ref(0);
    const current = common_vendor.ref(0);
    const menuHeight = common_vendor.ref(0);
    const menuItemHeight = common_vendor.ref(0);
    const itemId = common_vendor.ref("");
    common_vendor.ref([]);
    const arr = common_vendor.ref([]);
    const scrollRightTop = common_vendor.ref(0);
    const timer = common_vendor.ref(null);
    const tabbar = common_vendor.ref([]);
    const getCategoryList = async () => {
      let { data } = await api_category.getCategoryListApi();
      tabbar.value = data;
    };
    const swichMenu = async (index) => {
      if (arr.value.length == 0) {
        await getMenuItemTop();
      }
      if (index == current.value)
        return;
      scrollRightTop.value = oldScrollTop.value;
      common_vendor.nextTick(() => {
        scrollRightTop.value = arr.value[index];
        current.value = index;
        leftMenuStatus(index);
      });
    };
    const getElRect = (elClass, dataVal) => {
      new Promise((resolve, reject) => {
        const query = common_vendor.index.createSelectorQuery().in(instance);
        query.select("." + elClass).fields({
          size: true
        }, (res) => {
          if (!res) {
            setTimeout(() => {
              getElRect(elClass);
            }, 10);
            return;
          }
          instance[dataVal] = res.height;
          resolve();
        }).exec();
      });
    };
    const leftMenuStatus = async (index) => {
      current.value = index;
      if (menuHeight.value == 0 || menuItemHeight.value == 0) {
        await getElRect("menu-scroll-view", "menuHeight");
        await getElRect("u-tab-item", "menuItemHeight");
      }
      scrollTop.value = index * menuItemHeight.value + menuItemHeight.value / 2 - menuHeight.value / 2;
    };
    const getMenuItemTop = () => {
      new Promise((resolve) => {
        let selectorQuery = common_vendor.index.createSelectorQuery();
        selectorQuery.selectAll(".class-item").boundingClientRect((rects) => {
          if (!rects.length) {
            setTimeout(() => {
              getMenuItemTop();
            }, 10);
            return;
          }
          rects.forEach((rect) => {
            arr.value.push(rect.top - rects[0].top);
            resolve();
          });
        }).exec();
      });
    };
    const rightScroll = async (e) => {
      oldScrollTop.value = e.detail.scrollTop;
      if (arr.value.length == 0) {
        await getMenuItemTop();
      }
      if (timer.value)
        return;
      if (!menuHeight.value) {
        await getElRect("menu-scroll-view", "menuHeight");
      }
      timer.value = null;
      let scrollHeight = e.detail.scrollTop + menuHeight.value / 2;
      for (let i = 0; i < arr.value.length; i++) {
        let height1 = arr.value[i];
        let height2 = arr.value[i + 1];
        if (!height2 || scrollHeight >= height1 && scrollHeight < height2) {
          leftMenuStatus(i);
          return;
        }
      }
    };
    const toDetails = (infoId) => {
      console.log(infoId);
      common_vendor.index.navigateTo({
        url: "../details/details?infoId=" + infoId
      });
    };
    common_vendor.onLoad(() => {
      getCategoryList();
    });
    common_vendor.onReady(() => {
      getMenuItemTop();
    });
    return (_ctx, _cache) => {
      return {
        a: common_vendor.f(tabbar.value, (item, index, i0) => {
          return {
            a: common_vendor.t(item.name),
            b: index,
            c: common_vendor.n(current.value == index ? "u-tab-item-active" : ""),
            d: common_vendor.o(($event) => swichMenu(index), index)
          };
        }),
        b: scrollTop.value,
        c: itemId.value,
        d: common_vendor.f(tabbar.value, (item, index, i0) => {
          return {
            a: common_vendor.t(item.name),
            b: common_vendor.f(item.foods, (item1, index1, i1) => {
              return {
                a: item1.icon,
                b: common_vendor.t(item1.name),
                c: common_vendor.o(($event) => toDetails(item1.key), index1),
                d: index1
              };
            }),
            c: "item" + index,
            d: index
          };
        }),
        e: scrollRightTop.value,
        f: common_vendor.o(rightScroll)
      };
    };
  }
};
var MiniProgramPage = /* @__PURE__ */ common_vendor._export_sfc(_sfc_main, [["__scopeId", "data-v-0c56ccca"], ["__file", "D:/gitSpace/hotel-management-system/\u5C0F\u7A0B\u5E8F/wx-hotel/src/pages/category/category.vue"]]);
wx.createPage(MiniProgramPage);

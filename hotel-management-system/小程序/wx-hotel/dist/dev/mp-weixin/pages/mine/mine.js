"use strict";
var common_vendor = require("../../common/vendor.js");
if (!Array) {
  const _easycom_u_divider2 = common_vendor.resolveComponent("u-divider");
  const _easycom_u_icon2 = common_vendor.resolveComponent("u-icon");
  (_easycom_u_divider2 + _easycom_u_icon2)();
}
const _easycom_u_divider = () => "../../uni_modules/vk-uview-ui/components/u-divider/u-divider.js";
const _easycom_u_icon = () => "../../uni_modules/vk-uview-ui/components/u-icon/u-icon.js";
if (!Math) {
  (_easycom_u_divider + _easycom_u_icon)();
}
const _sfc_main = {
  __name: "mine",
  setup(__props) {
    const nickName = common_vendor.ref("\u5927\u5E55\u5B64\u70DF\u76F4");
    const avatarUrl = common_vendor.ref("/static/user.jpg");
    const toOrder = () => {
      if (!common_vendor.index.getStorageSync("avatarUrl") || !common_vendor.index.getStorageSync("nickName")) {
        common_vendor.index.getUserProfile({
          desc: "\u7528\u4E8E\u5934\u50CF\u6635\u79F0\u5C55\u793A",
          success: (res) => {
            console.log(res);
            nickName.value = res.userInfo.nickName;
            avatarUrl.value = res.userInfo.avatarUrl;
            common_vendor.index.setStorageSync("avatarUrl", res.userInfo.avatarUrl);
            common_vendor.index.setStorageSync("nickName", res.userInfo.nickName);
          }
        });
      }
      common_vendor.index.navigateTo({
        url: "../order/order"
      });
    };
    const toSuggest = () => {
      common_vendor.index.navigateTo({
        url: "../suggest/suggest"
      });
    };
    const toAbout = () => {
      common_vendor.index.navigateTo({
        url: "../about/about"
      });
    };
    const getUserInfo = () => {
      if (common_vendor.index.getStorageSync("avatarUrl") && common_vendor.index.getStorageSync("nickName")) {
        nickName.value = common_vendor.index.getStorageSync("nickName");
        avatarUrl.value = common_vendor.index.getStorageSync("avatarUrl");
      }
    };
    common_vendor.onLoad(() => {
      getUserInfo();
    });
    return (_ctx, _cache) => {
      return {
        a: avatarUrl.value,
        b: common_vendor.t(nickName.value),
        c: common_vendor.p({
          name: "order"
        }),
        d: common_vendor.p({
          name: "arrow-right"
        }),
        e: common_vendor.o(toOrder),
        f: common_vendor.p({
          name: "edit-pen"
        }),
        g: common_vendor.p({
          name: "arrow-right"
        }),
        h: common_vendor.o(toSuggest),
        i: common_vendor.p({
          name: "order"
        }),
        j: common_vendor.p({
          name: "arrow-right"
        }),
        k: common_vendor.o(toAbout)
      };
    };
  }
};
var MiniProgramPage = /* @__PURE__ */ common_vendor._export_sfc(_sfc_main, [["__file", "D:/gitSpace/hotel-management-system/\u5C0F\u7A0B\u5E8F/wx-hotel/src/pages/mine/mine.vue"]]);
wx.createPage(MiniProgramPage);

"use strict";
var common_vendor = require("../../common/vendor.js");
var api_home = require("../../api/home.js");
require("../../common/http.js");
if (!Array) {
  const _easycom_u_input2 = common_vendor.resolveComponent("u-input");
  const _easycom_u_form_item2 = common_vendor.resolveComponent("u-form-item");
  const _easycom_u_form2 = common_vendor.resolveComponent("u-form");
  (_easycom_u_input2 + _easycom_u_form_item2 + _easycom_u_form2)();
}
const _easycom_u_input = () => "../../uni_modules/vk-uview-ui/components/u-input/u-input.js";
const _easycom_u_form_item = () => "../../uni_modules/vk-uview-ui/components/u-form-item/u-form-item.js";
const _easycom_u_form = () => "../../uni_modules/vk-uview-ui/components/u-form/u-form.js";
if (!Math) {
  (_easycom_u_input + _easycom_u_form_item + _easycom_u_form)();
}
const _sfc_main = {
  __name: "suggest",
  setup(__props) {
    const suggest = common_vendor.reactive({
      title: "",
      context: "",
      openid: common_vendor.index.getStorageSync("openid")
    });
    const commit = async () => {
      if (!suggest.title) {
        common_vendor.index.showToast({
          title: "\u8BF7\u586B\u5199\u6807\u9898",
          duration: 2e3
        });
      }
      if (!suggest.context) {
        common_vendor.index.showToast({
          title: "\u8BF7\u586B\u5199\u5185\u5BB9",
          duration: 2e3
        });
      }
      const res = await api_home.addSuggestApi(suggest);
      if (res && res.code == 200) {
        common_vendor.index.showToast({
          title: res.msg,
          duration: 2e3
        });
        common_vendor.index.navigateBack();
      }
    };
    return (_ctx, _cache) => {
      return {
        a: common_vendor.o(($event) => suggest.title = $event),
        b: common_vendor.p({
          modelValue: suggest.title
        }),
        c: common_vendor.p({
          label: "\u6807\u9898"
        }),
        d: common_vendor.o(($event) => suggest.context = $event),
        e: common_vendor.p({
          type: "textarea",
          height: "300",
          border: true,
          modelValue: suggest.context
        }),
        f: common_vendor.p({
          label: "\u610F\u89C1"
        }),
        g: common_vendor.sr("uForm", "15484d77-0"),
        h: common_vendor.p({
          model: suggest
        }),
        i: common_vendor.o(commit)
      };
    };
  }
};
var MiniProgramPage = /* @__PURE__ */ common_vendor._export_sfc(_sfc_main, [["__file", "D:/gitSpace/hotel-management-system/\u5C0F\u7A0B\u5E8F/wx-hotel/src/pages/suggest/suggest.vue"]]);
wx.createPage(MiniProgramPage);

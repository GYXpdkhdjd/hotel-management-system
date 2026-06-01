"use strict";
var common_vendor = require("../../common/vendor.js");
var api_home = require("../../api/home.js");
require("../../common/http.js");
if (!Array) {
  const _easycom_u_divider2 = common_vendor.resolveComponent("u-divider");
  const _easycom_u_input2 = common_vendor.resolveComponent("u-input");
  const _easycom_u_form_item2 = common_vendor.resolveComponent("u-form-item");
  const _easycom_uni_datetime_picker2 = common_vendor.resolveComponent("uni-datetime-picker");
  const _easycom_u_form2 = common_vendor.resolveComponent("u-form");
  (_easycom_u_divider2 + _easycom_u_input2 + _easycom_u_form_item2 + _easycom_uni_datetime_picker2 + _easycom_u_form2)();
}
const _easycom_u_divider = () => "../../uni_modules/vk-uview-ui/components/u-divider/u-divider.js";
const _easycom_u_input = () => "../../uni_modules/vk-uview-ui/components/u-input/u-input.js";
const _easycom_u_form_item = () => "../../uni_modules/vk-uview-ui/components/u-form-item/u-form-item.js";
const _easycom_uni_datetime_picker = () => "../../uni_modules/uni-datetime-picker/components/uni-datetime-picker/uni-datetime-picker.js";
const _easycom_u_form = () => "../../uni_modules/vk-uview-ui/components/u-form/u-form.js";
if (!Math) {
  (_easycom_u_divider + _easycom_u_input + _easycom_u_form_item + _easycom_uni_datetime_picker + _easycom_u_form)();
}
const _sfc_main = {
  __name: "info",
  setup(__props) {
    const addModel = common_vendor.reactive({
      openid: common_vendor.index.getStorageSync("openid"),
      name: "",
      phone: "",
      roomId: "",
      roomCode: "",
      roomCount: 0,
      bookTime: ""
    });
    common_vendor.onLoad((options) => {
      console.log(options);
      const parm = JSON.parse(options.infos);
      addModel.roomId = parm.roomId.join(",");
      addModel.roomCode = parm.roomCode.join(",");
      addModel.roomCount = parm.roomCount;
      console.log(addModel);
    });
    const commit = async () => {
      console.log(addModel);
      if (!addModel.name) {
        common_vendor.index.showToast({
          icon: "none",
          title: "\u8BF7\u586B\u5199\u59D3\u540D",
          duration: 2e3
        });
        return;
      }
      if (!addModel.phone) {
        common_vendor.index.showToast({
          icon: "none",
          title: "\u8BF7\u586B\u5199\u7535\u8BDD",
          duration: 2e3
        });
        return;
      }
      if (!addModel.bookTime) {
        common_vendor.index.showToast({
          icon: "none",
          title: "\u8BF7\u9009\u62E9\u5230\u5E97\u65F6\u95F4",
          duration: 2e3
        });
        return;
      }
      const res = await api_home.bookOrderApi(addModel);
      console.log(res);
      if (res && res.code == 200) {
        common_vendor.index.redirectTo({
          url: "../order/order"
        });
      }
    };
    return (_ctx, _cache) => {
      return {
        a: common_vendor.p({
          height: "60",
          fontSize: "32"
        }),
        b: common_vendor.o(($event) => addModel.roomCode = $event),
        c: common_vendor.p({
          modelValue: addModel.roomCode
        }),
        d: common_vendor.p({
          label: "\u623F\u95F4:"
        }),
        e: common_vendor.o(($event) => addModel.roomCount = $event),
        f: common_vendor.p({
          modelValue: addModel.roomCount
        }),
        g: common_vendor.p({
          label: "\u6570\u91CF:"
        }),
        h: common_vendor.o(($event) => addModel.name = $event),
        i: common_vendor.p({
          modelValue: addModel.name
        }),
        j: common_vendor.p({
          label: "\u59D3\u540D:"
        }),
        k: common_vendor.o(($event) => addModel.phone = $event),
        l: common_vendor.p({
          modelValue: addModel.phone
        }),
        m: common_vendor.p({
          label: "\u7535\u8BDD:"
        }),
        n: common_vendor.o(($event) => addModel.bookTime = $event),
        o: common_vendor.p({
          border: false,
          modelValue: addModel.bookTime
        }),
        p: common_vendor.p({
          label: "\u5230\u5E97\u65F6\u95F4:"
        }),
        q: common_vendor.sr("uForm", "81714726-1"),
        r: common_vendor.p({
          labelPosition: "left",
          labelWidth: "140",
          model: addModel
        }),
        s: common_vendor.o(commit)
      };
    };
  }
};
var MiniProgramPage = /* @__PURE__ */ common_vendor._export_sfc(_sfc_main, [["__file", "D:/gitSpace/hotel-management-system/\u5C0F\u7A0B\u5E8F/wx-hotel/src/pages/info/info.vue"]]);
wx.createPage(MiniProgramPage);

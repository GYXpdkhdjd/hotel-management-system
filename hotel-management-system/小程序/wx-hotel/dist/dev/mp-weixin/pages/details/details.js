"use strict";
var common_vendor = require("../../common/vendor.js");
var api_home = require("../../api/home.js");
var api_user = require("../../api/user.js");
require("../../common/http.js");
if (!Array) {
  const _easycom_u_swiper2 = common_vendor.resolveComponent("u-swiper");
  const _easycom_u_tag2 = common_vendor.resolveComponent("u-tag");
  const _easycom_u_gap2 = common_vendor.resolveComponent("u-gap");
  const _easycom_u_icon2 = common_vendor.resolveComponent("u-icon");
  const _easycom_u_checkbox2 = common_vendor.resolveComponent("u-checkbox");
  const _easycom_u_checkbox_group2 = common_vendor.resolveComponent("u-checkbox-group");
  const _easycom_u_divider2 = common_vendor.resolveComponent("u-divider");
  const _easycom_u_parse2 = common_vendor.resolveComponent("u-parse");
  const _easycom_u_popup2 = common_vendor.resolveComponent("u-popup");
  (_easycom_u_swiper2 + _easycom_u_tag2 + _easycom_u_gap2 + _easycom_u_icon2 + _easycom_u_checkbox2 + _easycom_u_checkbox_group2 + _easycom_u_divider2 + _easycom_u_parse2 + _easycom_u_popup2)();
}
const _easycom_u_swiper = () => "../../uni_modules/vk-uview-ui/components/u-swiper/u-swiper.js";
const _easycom_u_tag = () => "../../uni_modules/vk-uview-ui/components/u-tag/u-tag.js";
const _easycom_u_gap = () => "../../uni_modules/vk-uview-ui/components/u-gap/u-gap.js";
const _easycom_u_icon = () => "../../uni_modules/vk-uview-ui/components/u-icon/u-icon.js";
const _easycom_u_checkbox = () => "../../uni_modules/vk-uview-ui/components/u-checkbox/u-checkbox.js";
const _easycom_u_checkbox_group = () => "../../uni_modules/vk-uview-ui/components/u-checkbox-group/u-checkbox-group.js";
const _easycom_u_divider = () => "../../uni_modules/vk-uview-ui/components/u-divider/u-divider.js";
const _easycom_u_parse = () => "../../uni_modules/vk-uview-ui/components/u-parse/u-parse.js";
const _easycom_u_popup = () => "../../uni_modules/vk-uview-ui/components/u-popup/u-popup.js";
if (!Math) {
  (_easycom_u_swiper + _easycom_u_tag + _easycom_u_gap + _easycom_u_icon + _easycom_u_checkbox + _easycom_u_checkbox_group + _easycom_u_divider + _easycom_u_parse + _easycom_u_popup)();
}
const _sfc_main = {
  __name: "details",
  setup(__props) {
    const title = common_vendor.ref("");
    const price = common_vendor.ref("");
    const details = common_vendor.ref("");
    const list = common_vendor.ref([]);
    const service = common_vendor.ref([]);
    const roomList = common_vendor.ref([]);
    const show = common_vendor.ref(false);
    const gather = common_vendor.ref([]);
    const stringList = common_vendor.ref(null);
    const onPatch = (roomId) => {
      let subscript = gather.value.indexOf(roomId);
      if (subscript > -1) {
        gather.value.splice(subscript, 1);
      } else {
        gather.value.push(roomId);
      }
      stringList.value = gather.value.join(",");
      console.log(stringList.value);
    };
    const toData = common_vendor.reactive({
      roomId: [],
      roomCode: [],
      roomCount: 0
    });
    const showCode = common_vendor.computed$1(() => {
      return toData.roomCode.length > 0 ? "\u5DF2\u9009\u62E9\u7F16\u53F7" + toData.roomCode.join(",") : "\u8BF7\u9009\u62E9\u623F\u95F4\u53F7";
    });
    const showBtn = () => {
      show.value = false;
      toData.roomId = [];
      toData.roomCode = [];
      toData.roomId = gather.value;
      toData.roomCount = gather.value.length;
      gather.value.map((item) => {
        let index = roomList.value.findIndex((dom) => dom.roomId == item);
        toData.roomCode.push(roomList.value[index].roomCode);
      });
    };
    const goToInfo = () => {
      if (toData.roomId.length == 0) {
        common_vendor.index.showToast({
          icon: "none",
          title: "\u8BF7\u9009\u62E9\u623F\u95F4",
          duration: 2e3
        });
        return;
      }
      common_vendor.index.navigateTo({
        url: "../info/info?infos=" + JSON.stringify(toData)
      });
    };
    const getInfoById = async (infoId) => {
      let {
        data
      } = await api_home.getInfoByIdApi(infoId);
      console.log(data);
      list.value = data.imgUrl;
      service.value = data.service;
      roomList.value = data.roomList;
      title.value = data.infoName;
      price.value = data.infoPrice;
      details.value = data.infoDetails;
    };
    const getCode = () => {
      const promise = new Promise((resolve, reject) => {
        common_vendor.index.login({
          provider: "weixin",
          success: function(loginRes) {
            if (loginRes && loginRes.code) {
              resolve(loginRes.code);
            } else {
              reject(loginRes);
            }
          }
        });
      }).catch((res) => {
        common_vendor.index.showToast({
          icon: "none",
          title: res.errMsg || "\u83B7\u53D6code\u5931\u8D25",
          duration: 2e3
        });
      });
      return promise;
    };
    const userLogin = async () => {
      let res = await getCode();
      const {
        data
      } = await api_user.wxLoginApi(res);
      console.log(data);
      if (data) {
        common_vendor.index.setStorageSync("openid", data.openid);
        common_vendor.index.setStorageSync("sessionKey", data.sessionKey);
      }
    };
    common_vendor.onLoad((options) => {
      console.log(options.infoId);
      getInfoById(options.infoId);
      userLogin();
    });
    return (_ctx, _cache) => {
      return {
        a: common_vendor.p({
          height: "350",
          list: list.value
        }),
        b: common_vendor.p({
          mode: "dark",
          text: "\u5546\u5BB6\u81EA\u8425",
          ["bg-color"]: "#FF7670"
        }),
        c: common_vendor.t(title.value),
        d: common_vendor.t(price.value),
        e: common_vendor.p({
          height: "20",
          ["bg-color"]: "#F5F5F5"
        }),
        f: common_vendor.t(common_vendor.unref(showCode)),
        g: common_vendor.p({
          name: "arrow-right"
        }),
        h: common_vendor.o(($event) => show.value = true),
        i: common_vendor.p({
          height: "20",
          ["bg-color"]: "#F5F5F5"
        }),
        j: common_vendor.f(service.value, (item, index, i0) => {
          return {
            a: common_vendor.t(item.name),
            b: index,
            c: "87e8d21a-6-" + i0 + ",87e8d21a-5",
            d: common_vendor.o(($event) => item.checked = $event, index),
            e: common_vendor.p({
              disabled: true,
              name: item.name,
              modelValue: item.checked
            })
          };
        }),
        k: common_vendor.p({
          height: "20",
          ["bg-color"]: "#F5F5F5"
        }),
        l: common_vendor.p({
          color: "#0eb6ff",
          height: "60"
        }),
        m: common_vendor.p({
          html: details.value
        }),
        n: common_vendor.f(roomList.value, (item, index, i0) => {
          return {
            a: common_vendor.t(item.roomCode),
            b: gather.value.indexOf(item.roomId) > -1 ? 1 : "",
            c: index,
            d: common_vendor.o(($event) => onPatch(item.roomId), index)
          };
        }),
        o: common_vendor.o(showBtn),
        p: common_vendor.o(($event) => show.value = $event),
        q: common_vendor.p({
          mode: "bottom",
          height: "70%",
          ["border-radius"]: "20",
          modelValue: show.value
        }),
        r: common_vendor.o(goToInfo)
      };
    };
  }
};
var MiniProgramPage = /* @__PURE__ */ common_vendor._export_sfc(_sfc_main, [["__file", "D:/gitSpace/hotel-management-system/\u5C0F\u7A0B\u5E8F/wx-hotel/src/pages/details/details.vue"]]);
wx.createPage(MiniProgramPage);

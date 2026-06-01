"use strict";
var common_http = require("../common/http.js");
const getSwapperListApi = () => {
  return common_http.http.get("/wxapi/home/swipperList");
};
const getHotListApi = () => {
  return common_http.http.get("/wxapi/home/getHotList");
};
const getInfoByIdApi = (infoId) => {
  return common_http.http.get("/wxapi/home/getInfoById", { infoId });
};
const bookOrderApi = (parm) => {
  return common_http.http.post("/wxapi/order/bookOrder", parm);
};
const getOrderListApi = (parm) => {
  return common_http.http.get("/wxapi/home/getOrderList", parm);
};
const addSuggestApi = (parm) => {
  return common_http.http.post("/wxapi/suggest", parm);
};
exports.addSuggestApi = addSuggestApi;
exports.bookOrderApi = bookOrderApi;
exports.getHotListApi = getHotListApi;
exports.getInfoByIdApi = getInfoByIdApi;
exports.getOrderListApi = getOrderListApi;
exports.getSwapperListApi = getSwapperListApi;

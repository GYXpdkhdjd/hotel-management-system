"use strict";
var common_http = require("../common/http.js");
const wxLoginApi = (code) => {
  return common_http.http.post("/wxapi/user/wxLogin", { code });
};
exports.wxLoginApi = wxLoginApi;

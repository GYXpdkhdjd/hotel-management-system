"use strict";
var common_vendor = require("./vendor.js");
const baseUrl = "http://localhost:8099";
const http = (options = {}) => {
  return new Promise((resolve, reject) => {
    common_vendor.index.request({
      url: baseUrl + options.url || "",
      method: options.type || "GET",
      data: options.data || {},
      header: options.header || {}
    }).then((response) => {
      console.log(response);
      resolve(response.data);
    }).catch((error) => {
      reject(error);
    });
  });
};
const get = (url, data, options = {}) => {
  options.type = "get";
  options.data = data;
  options.url = url;
  return http(options);
};
const post = (url, data, options = {}) => {
  options.type = "post";
  options.data = data;
  options.url = url;
  return http(options);
};
const put = (url, data, options = {}) => {
  options.type = "put";
  options.data = data;
  options.url = url;
  return http(options);
};
var http$1 = {
  get,
  post,
  put
};
exports.http = http$1;

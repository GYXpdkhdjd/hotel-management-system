import http from '../common/http.js'
//获取首页轮播图
export const getCategoryListApi = ()=>{
	return http.get("/wxapi/category/getCategoryList")
}
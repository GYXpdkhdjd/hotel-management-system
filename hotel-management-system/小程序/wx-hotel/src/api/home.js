import http from '../common/http.js'
//获取首页轮播图
export const getSwapperListApi = ()=>{
	return http.get("/wxapi/home/swipperList")
}
//获取热推客房
export const getHotListApi = ()=>{
	return http.get("/wxapi/home/getHotList")
}
//获取客房详情数据
export const getInfoByIdApi = (infoId)=>{
	return http.get("/wxapi/home/getInfoById",{infoId:infoId})
}
//客房预订提交
export const bookOrderApi = (parm)=>{
	return http.post("/wxapi/order/bookOrder",parm)
}
//查询订单
export const getOrderListApi = (parm)=>{
	return http.get("/wxapi/home/getOrderList",parm)
}
//提交意见
export const addSuggestApi = (parm)=>{
	return http.post("/wxapi/suggest",parm)
}
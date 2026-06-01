import http from "@/http";
import { BookParm, CancelParm } from "./BookModel";
//预订订单列表
export const getListApi = (parm:BookParm)=>{
    return http.get("/api/hotelOrder/getList",parm)
}
//取消预订订单
export const cacncelApi = (parm:CancelParm)=>{
    return http.post("/api/hotelOrder/cancelRoom",parm)
}
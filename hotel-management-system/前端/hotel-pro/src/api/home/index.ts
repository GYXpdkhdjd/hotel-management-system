import http from "@/http";
import {RoomParm,OrderType,CheckType} from './HomeModel'
export const getRoomListApi = (parm:RoomParm)=>{
    return http.get("/api/home/getHomeList",parm)
}
//空房api
export const addOrderApi = (parm:OrderType)=>{
    return http.post("/api/home/addOrder",parm)
}
//预订
export const bookOrderApi = (parm:OrderType)=>{
    return http.post("/api/home/bookOrder",parm)
}
//根据客房id查询客房
export const getInfoByIdApi = (roomId:string)=>{
    return http.get("/api/home/getInfoById",{roomId:roomId})
}
//退房
export const checkOrderApi = (parm:CheckType)=>{
    return http.post("/api/home/checkOrder",parm)
}
//启用房间
export const upRoomApi = (roomId:string)=>{
    return http.post("/api/home/upRoom",{roomId:roomId})
}
//统计
export const getTotalApi = ()=>{
    return http.get("/api/home/getTotal")
}
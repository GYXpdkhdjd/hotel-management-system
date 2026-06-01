import http from "@/http"
import { HotelInfoType, ListParm,AddRoom, RoomType } from "./HotelInfoModel"
//获取下拉数据列表
export const getSelectListApi = ()=>{
    return http.get("/api/type/getSelectList")
}
//新增
export const addApi = (parm:HotelInfoType)=>{
    return http.post("/api/hotelInfo",parm)
}
//主表查询
export const getListApi = (parm:ListParm)=>{
    return http.get("/api/hotelInfo/list",parm)
}
//子表查询
export const getChildListApi = (infoId:string)=>{
    return http.get("/api/hotelInfo/childList",{infoId:infoId})
}
//客房服务列表
export const getServiceListApi = ()=>{
    return http.get("/api/hotel/getList")
}
//回显客房服务id
export const getCheckListApi = (infoId:string)=>{
    return http.get("/api/hotel/getCheckList",{infoId:infoId})
}
//编辑
export const editApi = (parm:HotelInfoType)=>{
    return http.put("/api/hotelInfo",parm)
}
//删除
export const deleteApi = (infoId:string)=>{
    return http.delete(`/api/hotelInfo/${infoId}`)
}
//新增房间
export const addRoomApi = (parm:AddRoom)=>{
    return http.post("/api/hotelRoom/addRoom",parm)
}
//编辑房间
export const editRoomApi = (parm:RoomType)=>{
    return http.put("/api/hotelRoom/editRoom",parm)
}
//删除房间
export const deleteRoomApi = (roomId:string)=>{
    return http.delete(`/api/hotelRoom/${roomId}`)
}
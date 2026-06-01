import http from "@/http";
import { ListParm, ServiceType } from "./ServiceModel";
//新增
export const addApi = (parm:ServiceType)=>{
    return http.post("/api/hotel",parm)
}
//列表
export const getListApi = (parm:ListParm)=>{
    return http.get("/api/hotel/list",parm)
}
//编辑
export const editApi = (parm:ServiceType)=>{
    return http.put("/api/hotel",parm)
}
//删除
export const deleteApi = (serviceId:string)=>{
    return http.delete(`/api/hotel/${serviceId}`)
}
import http from "@/http";
import { TypeModel, TypeParm } from "./TypeModel";
//新增
export const addApi = (parm:TypeModel)=>{
    return http.post("/api/type",parm)
}
//列表
export const getListApi = (parm:TypeParm)=>{
    return http.get("/api/type/list",parm)
}
//编辑
export const editApi = (parm:TypeModel)=>{
    return http.put("/api/type",parm)
}
//删除
export const deleteApi = (typeId:string)=>{
    return http.delete(`/api/type/${typeId}`)
}
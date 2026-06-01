import http from "@/http";
import { AddUserModel, ListParm,ResetPassword } from "./UserModel";
//获取角色数据
export const getSelectApi = ()=>{
    return http.get("/api/role/getListSelect")
}
//新增
export const addApi = (parm:AddUserModel)=>{
    return http.post("/api/user",parm)
}
//列表
export const listApi = (parm:ListParm)=>{
    return http.get("/api/user/list",parm)
}
//编辑
export const editApi = (parm:AddUserModel)=>{
    return http.put("/api/user",parm)
}
//删除
export const deleteApi = (userId:string)=>{
    return http.delete(`/api/user/${userId}`)
}
//根据用户id查询角色id
export const getRoleIdApi = (userId:string)=>{
    return http.get("/api/user/getRoleId",{userId:userId})
}
//重置密码
export const resetPawordApi = (parm:ResetPassword)=>{
    return http.post("/api/user/resetPaword",parm)
}
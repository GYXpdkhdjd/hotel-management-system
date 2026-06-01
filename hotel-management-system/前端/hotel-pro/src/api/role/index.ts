import http from "@/http";
import { AddRoleModel, ListParm,AssignParm,SaveAssignParm } from "./RoleModel";
//新增
export const addApi = (parm: AddRoleModel) => {
    return http.post("/api/role", parm)
}
//列表
export const getListApi = (parm:ListParm)=>{
    return http.get("/api/role/list",parm)
}
//编辑
export const editApi = (parm: AddRoleModel) => {
    return http.put("/api/role", parm)
}
//删除
export const deleteApi = (roleId:string)=>{
    return http.delete(`/api/role/${roleId}`)
}
//查询权限树数据
export const getAssignTreeApi =(parm:AssignParm)=>{
    return http.get('/api/role/getAssignTree',parm)
}
//保存权限
export const assignSaveApi = (parm:SaveAssignParm)=>{
    return http.post("/api/role/assignSave",parm)
}
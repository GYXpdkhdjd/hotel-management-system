import http from "@/http";
import { SuggestParm } from "./SuggestModel";
//查询列表
export const getListApi = (parm:SuggestParm)=>{
    return http.get("/api/suggest/getList",parm)
}
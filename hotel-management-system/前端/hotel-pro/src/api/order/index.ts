import http from "@/http";
import { OrderParm } from "./OrderModel";
//入住订单列表
export const getListApi = (parm:OrderParm)=>{
    return http.get("/api/order/getList",parm)
}
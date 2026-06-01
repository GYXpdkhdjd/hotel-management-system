//入住订单列出查询的参数类型
export type BookParm = {
    name:string,
    phone:string,
    currentPage:number,
    pageSize:number,
    total:number
}
export type CancelParm = {
    orderId:string;
    status:string;
}
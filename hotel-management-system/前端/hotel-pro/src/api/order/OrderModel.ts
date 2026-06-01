//入住订单列出查询的参数类型
export type OrderParm = {
    name:string,
    phone:string,
    idCard:string,
    currentPage:number,
    pageSize:number,
    total:number
}
//列表查询参数类型
export type ListParm = {
    name:string,
    currentPage:number,
    pageSize:number,
    total:number
}
//服务数据类型
export type ServiceType = {
    type:string,
    serviceId:string,
    name:string,
    orderNum:number | string
}
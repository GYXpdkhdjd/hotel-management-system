//列表查询数据类型
export type TypeParm = {
    name:string,
    currentPage:number,
    pageSize:number,
    total:number
}
//房间类型数据类型
export type TypeModel = {
    type:string,
    typeId:string,
    name:string,
    orderNum:number | string
}
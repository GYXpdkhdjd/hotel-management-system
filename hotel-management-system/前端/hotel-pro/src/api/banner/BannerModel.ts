//列出查询的参数类型
export type BannerListParm = {
    title:string,
    currentPage:number,
    pageSize:number,
    total:number
}
//广告数据类型
export type BannerType = {
    type:string,
    banId:string,
    infoId:string,
    title:string,
    images:string,
    status:string | boolean,
    
}
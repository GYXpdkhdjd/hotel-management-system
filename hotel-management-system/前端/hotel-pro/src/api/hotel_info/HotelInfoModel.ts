//列表参数类型
export type ListParm = {
    infoName:string,
    currentPage:number,
    pageSize:number,
    total:number
}
//客房数据类型
export type HotelInfoType = {
    type:string,
    infoId:string,
    typeId:string,
    infoName:string,
    imgUrl:string,
    infoDetails:string,
    infoPrice:number | string,
    infoBed:number |string,
    infoCount:number |string,
    infoStatus:string | boolean,
    toIndex?:string | boolean,
    start:number | string,
    end:number | string,
    orderNum:number | string,
    service:Array<any>, //复选框数据
    checkService:Array<any>, //复选框选中数据
    roomList?:Array<any>
}
//新增房间数据类型
export type AddRoom = {
    type:string;
    roomId:string;
    infoId:string;
    roomCode:string;
    intoStatus:string;
    bookStatus:string;
    useStatus:string;
}
//房间数据类型
export type RoomType = {
    roomId:string;
    infoId:string;
    roomCode:string;
    intoStatus:string;
    bookStatus:string;
    useStatus:string;
}
export type RoomParm = {
    typeId:string;
    roomCode:string;
    bookStatus:string;
    useStatus:string;
}
//信息录入数据类型
export type OrderType = {
    name:string;
    phone:string;
    cardType:string;
    cardNum:string;
    sex:string;
    roomId:string;
    roomCode:string;
    user?:string;
    price?:string;
}
//退房参数类型
export type CheckType = {
    orderId:string;
    roomId:string;
    price:string;
}
//定义下拉的数据类型
export type SelectType = {
    value: string,
    label: string
}
//下拉的返回数据类型
export type SelectTypeList = {
    list: SelectType[],
    roleId?:string
}
//列表查询参数类型
export type ListParm = {
    phone: string,
    nickName: string,
    currentPage: number,
    pageSize: number,
    total: number
}
//用户数据类型
export type AddUserModel = {
    type: string,
    userId: string,
    roleId: string,
    username: string,
    password: string,
    phone: string,
    email: string,
    sex: string,
    enabled:boolean
    nickName: string,
    salary:''
}
//重置密码数据类型
export type ResetPassword = {
    userId:string,
    enabled:boolean
}
import { getSelectApi,getRoleIdApi } from "@/api/user";
import { SelectTypeList } from "@/api/user/UserModel";
import {  reactive } from "vue";
export default function useSelectRole(){
    //角色数据
    const roleData = reactive<SelectTypeList>({
        list:[],
        roleId:''
    })
    //获取数据
    const listRole = async()=>{
        let res = await getSelectApi()
        if(res && res.code == 200){
            console.log(res)
            roleData.list = res.data;
        }
    }
    //根据用户id查询角色id
    const getRoleId = async(userId:string)=>{
        let res = await getRoleIdApi(userId)
        if(res && res.code == 200 && res.data){
            console.log(res)
            roleData.roleId = res.data.roleId;
        }
    }
    // onMounted(()=>{
    //     listRole()
    // })
    return{
        roleData,
        listRole,
        getRoleId
    }
}
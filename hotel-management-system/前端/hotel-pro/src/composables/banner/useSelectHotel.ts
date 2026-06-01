import { getSelectApi } from "@/api/banner/index";
import { SelectTypeList } from "@/api/user/UserModel";
import {  reactive } from "vue";
export default function useSelectHotel(){
    //客房数据
    const hotelData = reactive<SelectTypeList>({
        list:[],
        roleId:''
    })
    //获取数据
    const listHotel = async()=>{
        let res = await getSelectApi()
        if(res && res.code == 200){
            console.log(res)
            hotelData.list = res.data;
        }
    }
    return{
        hotelData,
        listHotel
    }
}
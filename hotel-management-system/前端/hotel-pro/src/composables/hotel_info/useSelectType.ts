import { reactive } from "vue";
import { getSelectListApi } from "@/api/hotel_info";
import { SelectTypeList } from "@/api/user/UserModel";
export default function useSelectType(){
    //下拉数据
    const selectData = reactive<SelectTypeList>({
        list:[]
    })
    //获取下拉数据
    const getSelectList = async()=>{
        let res = await getSelectListApi()
        if(res && res.code == 200){
            selectData.list = res.data;
        }
    }
    return{
        selectData,
        getSelectList
    }
}
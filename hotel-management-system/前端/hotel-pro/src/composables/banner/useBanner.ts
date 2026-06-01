import { BannerType } from "@/api/banner/BannerModel"
import { EditType } from "@/type/BaseEnum"
import { ref } from "vue"
import useInstance from "@/hooks/useInstance"
import { deleteApi } from "@/api/banner"
import { ElMessage } from "element-plus"
import { FuncList } from "@/type/BaseType"
export default function useBanner(getList:FuncList) {
    const { global } = useInstance()
    const addRef = ref<{ show: (type: string, row?: BannerType) => void }>()
    //新增
    const addBtn = () => {
        addRef.value?.show(EditType.ADD)
    }
    //编辑
    const editBtn = (row: BannerType) => {
        addRef.value?.show(EditType.EDIT, row)
    }
    //删除
    const deleteBtn = async(row: BannerType) => {
        const confirm = await global.$myconfirm('确定删除该数据吗?')
        if(confirm){
            let res = await deleteApi(row.banId)
            if(res && res.code == 200){
                ElMessage.success(res.msg)
                //刷新表格
                getList()
            }
        }
    }
    return {
        addBtn,
        editBtn,
        deleteBtn,
        addRef,
        global
    }
}
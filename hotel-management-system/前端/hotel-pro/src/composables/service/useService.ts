import { ServiceType } from "@/api/service/ServiceModel"
import { EditType } from "@/type/BaseEnum"
import { ref } from "vue"
import useInstance from "@/hooks/useInstance"
import { deleteApi } from "@/api/service"
import { ElMessage } from "element-plus"
import { FuncList } from "@/type/BaseType"
export default function useService(getList:FuncList) {
    const { global } = useInstance()
    const addRef = ref<{ show: (type: string, row?: ServiceType) => void }>()
    //新增
    const addBtn = () => {
        addRef.value?.show(EditType.ADD)
    }
    //编辑
    const editBtn = (row: ServiceType) => {
        addRef.value?.show(EditType.EDIT, row)
    }
    //删除
    const deleteBtn = async(row: ServiceType) => {
        const confirm = await global.$myconfirm('确定删除该数据吗?')
        if(confirm){
            let res = await deleteApi(row.serviceId)
            if(res && res.code == 200){
                ElMessage.success(res.msg)
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
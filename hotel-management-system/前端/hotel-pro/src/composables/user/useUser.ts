import { AddUserModel } from "@/api/user/UserModel"
import { deleteApi,resetPawordApi } from "@/api/user"
import { EditType } from "@/type/BaseEnum"
import { ref } from "vue"
import useInstance from "@/hooks/useInstance"
import { ElMessage } from "element-plus"
import { FuncList } from "@/type/BaseType"
export default function useUser(getList:FuncList){
    const {global} = useInstance()
    //弹框的ref属性
    const addRef = ref<{show:(type:string,row?:AddUserModel)=>void}>()
    //新增
    const addBtn = ()=>{
        addRef.value?.show(EditType.ADD)
    }
    //编辑
    const editBtn = (row:AddUserModel)=>{
        addRef.value?.show(EditType.EDIT,row)
    }
    //删除
    const deleteBtn = async(row:AddUserModel)=>{
        const cofirm = await global.$myconfirm('确定删除该数据吗?')
        if(cofirm){
            let res = await deleteApi(row.userId)
            if(res && res.code == 200){
                ElMessage.success(res.msg)
                //刷新表格
                getList()
            }
        }
    }
    //重置密码
    const resetPawBtn = async(row:AddUserModel)=>{
        const confirm = await global.$myconfirm('确定重置密码吗?重置之后密码为【666666】')
        if(confirm){
            let res = await resetPawordApi({
                userId:row.userId,
                enabled:row.enabled
            })
            if(res && res.code == 200){
                ElMessage.success(res.msg)
            }
        }
    }
    return{
        addBtn,
        editBtn,
        deleteBtn,
        addRef,
        resetPawBtn,
        global
    }
}
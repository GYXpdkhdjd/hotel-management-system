import { AddRoleModel } from "@/api/role/RoleModel"
import { EditType } from "@/type/BaseEnum"
import { ref } from "vue"
import { deleteApi } from "@/api/role"
import useInstance from "@/hooks/useInstance"
import { ElMessage } from "element-plus"
import { FuncList } from "@/type/BaseType"
export default function useRole(getList:FuncList) {
    //分配权限弹框ref属性
    const assignRoleRef = ref<{ show: (roleId: string, name: string) => void }>()
    const { global } = useInstance()
    //新增弹框的ref属性
    const addRef = ref<{ show: (type: string, row?: AddRoleModel) => void }>()
    //新增
    const addBtn = () => {
        addRef.value?.show(EditType.ADD)
    }
    //编辑
    const editBtn = (row: AddRoleModel) => {
        console.log(row)
        addRef.value?.show(EditType.EDIT, row)
    }
    //删除
    const deleteBtn = async (row: AddRoleModel) => {
        console.log(row)
        //信息确定
        let confirm = await global.$myconfirm('确定删除该数据吗？')
        if (confirm) {
            let res = await deleteApi(row.roleId)
            if(res && res.code == 200){
                //信息提示，刷新表格
                ElMessage.success(res.msg)
                //刷新
                getList()
            }
        }

    }
    //分配权限按钮
    const assignBtn = (row: AddRoleModel) => {
        assignRoleRef.value?.show(row.roleId,row.roleName)
    }
    return {
        addBtn,
        editBtn,
        deleteBtn,
        addRef,
        assignRoleRef,
        assignBtn,
        global
    }
}
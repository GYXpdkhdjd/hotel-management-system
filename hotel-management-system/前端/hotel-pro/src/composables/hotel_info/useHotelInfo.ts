import { EditType } from "@/type/BaseEnum"
import { ref,reactive } from "vue"
import { HotelInfoType, RoomType } from '@/api/hotel_info/HotelInfoModel'
import useInstance from "@/hooks/useInstance"
import { deleteApi, editApi } from '@/api/hotel_info/index'
import { ElMessage } from "element-plus"
import { FuncList } from "@/type/BaseType"
export default function useHotelInfo(getList?: FuncList) {
    //新增房间弹框的ref属性
    const addRoom = ref<{ show: (type: string, row?: HotelInfoType, child?: RoomType) => void }>()
    const { global } = useInstance()
    const addRef = ref<{ show: (type: string, row?: HotelInfoType) => void }>()
    //新增
    const addBtn = () => {
        addRef.value?.show(EditType.ADD)
    }
    //编辑
    const editBtn = (row: HotelInfoType) => {
        addRef.value?.show(EditType.EDIT, row)
    }
    //删除
    const deleteBtn = async (row: HotelInfoType) => {
        const confirm = await global.$myconfirm('确定删除该数据吗?')
        if (confirm) {
            const res = await deleteApi(row.infoId)
            if (res && res.code == 200) {
                ElMessage.success(res.msg)
                //刷新表格
                if (getList) {
                    getList()
                }
            }
        }
    }
    //新增房间
    const addRoomBtn = (row: HotelInfoType) => {
        addRoom.value?.show(EditType.ADD, row)
    }
    //客房启用、停用按钮
    const turnBtn = async(row: HotelInfoType) => {
        console.log(row)
        //编辑的对象
        const addModel = reactive<HotelInfoType>({
            type: "",
            infoId: "",
            typeId: "",
            infoName: "",
            imgUrl: "",
            infoDetails: "",
            infoPrice: "",
            infoBed: "",
            infoCount: "",
            infoStatus: "",
            toIndex:'',
            start: "",
            end: "",
            orderNum: "",
            service: [],
            checkService: [],
        });
        addModel.infoId = row.infoId;
        addModel.toIndex = row.toIndex;
        addModel.infoStatus = row.infoStatus;
        let res = await editApi(addModel)
        if(res && res.code == 200){
            ElMessage.success(res.msg)
            //刷新表格
            if (getList) {
                getList()
            }
        }
    }
    //设为热推
    const setHotBtn = async(row: HotelInfoType) => {
        console.log(row)
        //编辑的对象
        const addModel = reactive<HotelInfoType>({
            type: "",
            infoId: "",
            typeId: "",
            infoName: "",
            imgUrl: "",
            infoDetails: "",
            infoPrice: "",
            infoBed: "",
            infoCount: "",
            infoStatus: "",
            toIndex:'',
            start: "",
            end: "",
            orderNum: "",
            service: [],
            checkService: [],
        });
        addModel.infoId = row.infoId;
        addModel.infoStatus = row.infoStatus;
        addModel.toIndex = row.toIndex;
        let res = await editApi(addModel)
        if(res && res.code == 200){
            ElMessage.success(res.msg)
            //刷新表格
            if (getList) {
                getList()
            }
        }
    }
    const drawer = ref(false)
    const cancelClick = () => {
        drawer.value = false
    }
    const confirmClick = () => {
        drawer.value = false
    }
    return {
        addBtn,
        editBtn,
        deleteBtn,
        drawer,
        cancelClick,
        confirmClick,
        addRef,
        addRoomBtn,
        addRoom,
        turnBtn,
        setHotBtn,
        global
    }
}
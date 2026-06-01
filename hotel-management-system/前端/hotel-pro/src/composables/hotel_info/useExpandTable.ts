import { getChildListApi } from "@/api/hotel_info";
import { HotelInfoType, RoomType, AddRoom } from "@/api/hotel_info/HotelInfoModel";
import { EditType } from "@/type/BaseEnum";
import { editRoomApi, deleteRoomApi } from "@/api/hotel_info";
import useInstance from "@/hooks/useInstance";
import { reactive } from "vue";
import { ElMessage } from "element-plus";
export default function useExpandTable(tableRef: any, addRoom: any) {
    const { global } = useInstance()
    const getRoomList = async (infoId: string) => {
        let res = await getChildListApi(infoId)
        if (res && res.code == 200) {
            console.log(tableRef)
            // row.roomList = res.data;
            tableRef.value.data.map((item: HotelInfoType) => {
                if (item.infoId == infoId) {
                    item.roomList = res.data;
                }
            })
        }
    }
    //编辑房间
    const editRoomBtn = (row: RoomType) => {
        console.log(row)
        addRoom.value.show(EditType.EDIT, {}, row)
    }
    //维修按钮
    const repairRoomBtn = async (row: RoomType) => {
        const confrim = await global.$myconfirm('确定维修房间吗?')
        if (confrim) {
            const addModel = reactive<AddRoom>({
                type: "",
                roomId: "",
                infoId: "",
                roomCode: "",
                intoStatus: "",
                bookStatus: "",
                useStatus: "",
            });
            addModel.roomId = row.roomId
            addModel.bookStatus = "3"
            let res = await editRoomApi(addModel)
            if (res && res.code == 200) {
                ElMessage.success(res.msg)
                getRoomList(row.infoId)
            }
        }
    }
    //启动
    const startRoomBtn = async (row: RoomType) => {
        const confrim = await global.$myconfirm('确定启用房间吗?')
        if (confrim) {
            const addModel = reactive<AddRoom>({
                type: "",
                roomId: "",
                infoId: "",
                roomCode: "",
                intoStatus: "",
                bookStatus: "",
                useStatus: "",
            });
            addModel.roomId = row.roomId
            addModel.bookStatus = "0"
            let res = await editRoomApi(addModel)
            if (res && res.code == 200) {
                ElMessage.success(res.msg)
                getRoomList(row.infoId)
            }
        }
    }
    //停用
    const stopRoomBtn = async (row: RoomType) => {
        const confrim = await global.$myconfirm('确定停用房间吗?')
        if (confrim) {
            const addModel = reactive<AddRoom>({
                type: "",
                roomId: "",
                infoId: "",
                roomCode: "",
                intoStatus: "",
                bookStatus: "",
                useStatus: "",
            });
            addModel.roomId = row.roomId
            addModel.bookStatus = "4"
            let res = await editRoomApi(addModel)
            if (res && res.code == 200) {
                ElMessage.success(res.msg)
                getRoomList(row.infoId)
            }
        }
    }
    //删除
    const roomDeleteBtn = async (row: RoomType) => {
        const confrim = await global.$myconfirm('确定删除房间吗?')
        if (confrim) {
            let res = await deleteRoomApi(row.roomId)
            if (res && res.code == 200) {
                ElMessage.success(res.msg)
                getRoomList(row.infoId)
            }
        }
    }
    //展开事件
    const openChange = (row: HotelInfoType) => {
        getRoomList(row.infoId)
    }
    return {
        getRoomList,
        editRoomBtn,
        repairRoomBtn,
        startRoomBtn,
        stopRoomBtn,
        roomDeleteBtn,
        openChange
    }
}
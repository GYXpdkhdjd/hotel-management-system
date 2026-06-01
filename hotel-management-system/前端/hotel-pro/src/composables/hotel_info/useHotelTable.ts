import { ListParm } from "@/api/hotel_info/HotelInfoModel";
import { nextTick, onMounted, reactive, ref } from "vue";
import { getListApi } from "@/api/hotel_info";
export default function useHotelTable(){
    //表格高度
    const tableHeight = ref(0)
    //列表参数
    const listParm =  reactive<ListParm>({
        currentPage:1,
        pageSize:10,
        total:0,
        infoName:''
    })
    //表格数据
    const tableList = ref([])
    //列表查询
    const getList = async()=>{
        let res = await getListApi(listParm)
        if(res && res.code == 200){
            tableList.value = res.data.records;
            listParm.total = res.data.total;
        }
    }
    //搜索
    const searchBtn = ()=>{
        getList()
    }
    //重置
    const resetBtn = ()=>{
        listParm.infoName = ''
        getList()
    }
    //页容量改变时触发
    const sizeChange = (size:number)=>{
        listParm.pageSize = size;
        getList()
    }
    //页数改变时触发
    const currentChange = (page:number)=>{
        listParm.currentPage = page;
        getList()
    }
    onMounted(()=>{
        getList()
        nextTick(()=>{
            tableHeight.value = window.innerHeight - 230
        })
    })
    return{
        listParm,
        getList,
        searchBtn,
        resetBtn,
        tableList,
        sizeChange,
        currentChange,
        tableHeight
    }
}
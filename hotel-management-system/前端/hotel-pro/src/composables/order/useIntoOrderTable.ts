import { nextTick, onMounted, reactive, ref } from "vue";
import { OrderParm } from "@/api/order/OrderModel";
import { getListApi } from "@/api/order";
export default function useIntoOrderTable(){
    //表格高度
    const tableHeigth = ref(0)
    //表格数据
    const tableList = ref([])
    //列表参数
    const listParm = reactive<OrderParm>({
        currentPage:1,
        pageSize:10,
        name:'',
        phone:'',
        idCard:'',
        total:0
    })
    //列表
    const getList = async()=>{
        let res = await getListApi(listParm)
        if(res && res.code == 200){
            tableList.value = res.data.records;
            listParm.total = res.data.total;
        }
    }
    const searchBtn = ()=>{
        getList()
    }
    const resetBtn = ()=>{
        listParm.currentPage = 1;
        listParm.idCard = ''
        listParm.name = ''
        listParm.phone = ''
        getList()
    }
    const sizeChange = (size:number)=>{
        listParm.pageSize = size;
        getList()
    }
    const currentChange = (page:number)=>{
        listParm.currentPage = page;
        getList()
    }
    onMounted(()=>{
        getList()
        nextTick(()=>{
            tableHeigth.value = window.innerHeight - 230
        })
    })
    return{
        tableList,
        listParm,
        getList,
        searchBtn,
        resetBtn,
        sizeChange,
        currentChange,
        tableHeigth
    }
}
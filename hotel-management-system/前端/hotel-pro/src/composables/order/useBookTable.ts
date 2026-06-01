import { BookParm } from "@/api/book_order/BookModel"
import { nextTick, onMounted,reactive,ref } from "vue"
import { getListApi,cacncelApi } from "@/api/book_order";
import useInstance from "@/hooks/useInstance";
import { ElMessage } from "element-plus";
export default function useBookTable(){
    const {global} = useInstance()
    //表格高度
    const tableHeigth = ref(0)
    //表格数据
    const tableList = ref([])
    //列表参数
    const listParm = reactive<BookParm>({
        currentPage:1,
        pageSize:10,
        name:'',
        phone:'',
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
    //取消
    const cancelBtn = async(item:any)=>{
        const confrim = await global.$myconfirm('确定取消预订吗？')
        if(confrim){
            let res = await cacncelApi({
                orderId:item.orderId,
                status:'4'
            })
            if(res && res.code == 200){
                ElMessage.success(res.msg)
                getList()
            }
        }
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
        tableHeigth,
        cancelBtn
    }
}
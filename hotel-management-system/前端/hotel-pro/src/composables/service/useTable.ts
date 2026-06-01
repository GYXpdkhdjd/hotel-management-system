import { ListParm } from "@/api/service/ServiceModel";
import { nextTick, onMounted, reactive, ref } from "vue";
import { getListApi } from "@/api/service";
export default function useTable(){
    //表格高度
    const tableHeight = ref(0)
    //列表查询的参数
    const listParm = reactive<ListParm>({
        pageSize:10,
        currentPage:1,
        name:'',
        total:0
    })
    //定义表格数据
    const tableList = reactive({
        list:[]
    })
    //列表
    const getList = async()=>{
        let res = await getListApi(listParm)
        if(res && res.code == 200){
            console.log(res)
            tableList.list = res.data.records;
            listParm.total = res.data.total;
        }
    }
    //搜索
    const searchBtn = ()=>{
        getList()
    }
    //重置
    const resetBtn = ()=>{
        listParm.name = ''
        getList()
    }
    //页容量改变触发
    const sizeChange = (size:number)=>{
        listParm.pageSize = size;
        getList()
    }
    //页数改变触发
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
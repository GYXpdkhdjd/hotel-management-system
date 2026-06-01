import { nextTick, onMounted, reactive, ref } from "vue";
import { SuggestParm } from "@/api/suggest/SuggestModel";
import { getListApi } from "@/api/suggest";
export default function useSuggestTable(){
    //表格高度
    const tableHeigth = ref(0)
    //表格数据
    const tableList = ref([])
    //列表参数
    const listParm = reactive<SuggestParm>({
        currentPage:1,
        pageSize:10,
        title:'',
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
        listParm.title = ''
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
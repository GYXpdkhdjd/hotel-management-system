import { TypeParm } from "@/api/type/TypeModel";
import { nextTick, onMounted, reactive, ref } from "vue";
import { getListApi } from "@/api/type";
export default function useTypeTable(){
    //表格高度
    const tableHeight = ref(0)
    //列表查询参数
    const listParm = reactive<TypeParm>({
        name:'',
        currentPage:1,
        pageSize:10,
        total:0
    })
    //表格数据
    const tableList = reactive({
        list:[]
    })
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
    const currentChange =(page:number)=>{
        listParm.currentPage = page;
        getList()
    }
    //获取列表
    const getList = async()=>{
        let res = await getListApi(listParm)
        if(res && res.code ==200){
            tableList.list = res.data.records;
            listParm.total = res.data.total;
        }
    }
    onMounted(()=>{
        getList()
        nextTick(()=>{
            tableHeight.value = window.innerHeight - 230
        })
    })
    return{
        listParm,
        searchBtn,
        resetBtn,
        tableList,
        getList,
        sizeChange,
        currentChange,
        tableHeight
    }
}
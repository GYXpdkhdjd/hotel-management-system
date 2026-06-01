import { ListParm } from "@/api/user/UserModel";
import { nextTick, onMounted, reactive, ref } from "vue";
import { listApi } from "@/api/user";
export default function useTable() {
    //表格高度
    const tableHeight = ref(0)
    //列表参数
    const listParm = reactive<ListParm>({
        phone: '',
        nickName: '',
        currentPage: 1,
        pageSize: 10,
        total: 0
    })
    //定义表格数据
    const tableList = reactive({
        list:[]
    })
    //查询列表
    const getList = async()=>{
        let res = await listApi(listParm)
        if(res && res.code == 200){
            console.log(res)
            tableList.list = res.data.records
            listParm.total = res.data.total;
        }
    }
    //搜索
    const searchBtn = ()=>{
        getList()
    }
    //重置
    const resetBtn = ()=>{
        listParm.nickName = ''
        listParm.phone = ''
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
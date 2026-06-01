import { BannerListParm, BannerType } from "@/api/banner/BannerModel";
import { nextTick, onMounted, reactive, ref } from "vue";
import { listApi, editApi } from "@/api/banner";
import { ElMessage } from "element-plus";

export default function useBannerTable() {
    const tableHeight = ref(0)
    //列表查询的参数
    const listParm = reactive<BannerListParm>({
        pageSize: 10,
        currentPage: 1,
        title: '',
        total: 0
    })
    //表格数据
    const tableList = ref([])
    //列表查询
    const getList = async () => {
        let res = await listApi(listParm)
        if (res && res.code == 200) {
            tableList.value = res.data.records;
            listParm.total = res.data.total;
        }
    }
    //搜索
    const searchBtn = () => {
        getList()
    }
    //重置
    const resetBtn = () => {
        listParm.title = ''
        getList()
    }
    //页容量改变时触发
    const sizeChange = (size: number) => {
        listParm.pageSize = size;
        getList()
    }
    //页数改变时触发
    const currentChange = (page: number) => {
        listParm.currentPage = page;
        getList()
    }
    //上下架
    const upBtn = async(row: BannerType) => {
        const addModel = reactive<BannerType>({
            type: "",
            banId: "",
            infoId: "",
            title: "",
            images: "",
            status: "",
        });
        addModel.banId = row.banId;
        addModel.status = row.status;
        let res = await editApi(addModel)
        if(res && res.code == 200){
            ElMessage.success(res.msg)
            getList()
        }
    }
    onMounted(() => {
        getList()
        nextTick(() => {
            tableHeight.value = window.innerHeight - 230
        })
    })
    return {
        listParm,
        getList,
        searchBtn,
        resetBtn,
        tableList,
        upBtn,
        sizeChange,
        currentChange,
        tableHeight
    }
}
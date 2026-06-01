import { ref, onMounted } from "vue";
import { getSelectListApi } from "@/api/hotel_info/index";
import { SelectType } from "@/api/user/UserModel";
export default function useCategory() {
    //容器高度
    const height = ref(0);
    //当前点击的按钮
    const currentIndex = ref(0)
    //分类数据
    const category = ref([
        {
            value: "",
            label: "全部客房",
        },
    ]);
    
    //获取分类数据
    const getCategory = async () => {
        let res = await getSelectListApi();
        if (res.data && res.data.length > 0) {
            res.data.map((item: SelectType) => {
                category.value.push(item);
            });
        }
        console.log(category.value)
    };
    onMounted(() => {
        height.value = window.innerHeight - 100;
        getCategory()
    });
    return{
        height,
        currentIndex,
        category
    }
}
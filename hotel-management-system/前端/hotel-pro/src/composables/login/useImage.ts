import { onMounted, ref } from "vue";
import { getImageApi } from "@/api/login";
export default function useImage(){
    //定义接收验证码
    const imgSrc = ref('')
    const getImage = async()=>{
        let res = await getImageApi()
        console.log(res)
        if(res && res.code == 200){
            imgSrc.value = res.data;
        }
    }
    onMounted(()=>{
        getImage()
    })
    return{
        imgSrc,
        getImage
    }
}
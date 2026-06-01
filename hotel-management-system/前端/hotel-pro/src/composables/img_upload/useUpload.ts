import type { UploadFile, UploadUserFile,UploadFiles } from 'element-plus'
import { ref } from 'vue'
import { ElMessage } from 'element-plus'
import { uploadImageApi } from '@/api/img/index'
export default function useUpload() {
    //图片上传组件的ref属性
    const uploadRef = ref();
    const dialogImageUrl = ref('')
    const dialogVisible = ref(false)
    const disabled = ref(false)
    //图片上传成功后的地址
    const imgUrl = ref<Array<{ url: string }>>([]);
    //图片上传的数据
    const fileList = ref<UploadUserFile[]>([])
    //删除图片
    const handleRemove = (file: UploadFile) => {
        //清空图片
        imgUrl.value = []
        console.log(file)
        fileList.value = fileList.value.filter(item => item.name != file.name)
        for (let k = 0; k < fileList.value.length; k++) {
            imgUrl.value.push({ url: fileList.value[k].url || '' })
        }
    }
    //文件个数超出
    const moreLimit = (files: File[], uploadFiles: UploadFiles) => {
        ElMessage.warning('最多只能上传' + uploadFiles.length + "张图片!")
    }
    //图片预览
    const handlePictureCardPreview = (file: UploadFile) => {
        dialogImageUrl.value = file.url!
        dialogVisible.value = true
    }
    //图片上传
    const uploadFile = async (file: any) => {
        //判断选择的图片是不是图片类型
        const typeArr = ["image/png", "image/gif", "image/jpeg", "image/jpg"];
        const isImg = typeArr.indexOf(file.raw.type) !== -1;
        const isMore3M = file.size / 1024 / 1024 < 3;
        if (!isImg) {
            ElMessage.warning("只能上传图片类型!");
            uploadRef.value?.clearFiles()
            return;
        }
        if (!isMore3M) {
            ElMessage.warning("图片大小不能超过3M!");
            uploadRef.value?.clearFiles()
            return;
        }
        //数据提交
        const formData = new FormData();
        formData.append("file", file.raw);
        let res = await uploadImageApi(formData)
        if (res && res.code == 200 && res.data) {
            ElMessage.success("图片上传成功!");
            imgUrl.value.push({url:process.env.BASE_API + res.data})
        }
    }
    return {
        dialogImageUrl,
        dialogVisible,
        disabled,
        handleRemove,
        handlePictureCardPreview,
        uploadFile,
        uploadRef,
        imgUrl,
        fileList,
        moreLimit
    }
}
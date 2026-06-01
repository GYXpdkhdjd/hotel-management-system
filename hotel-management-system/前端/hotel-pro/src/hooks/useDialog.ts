import { DialogModel } from "@/type/BaseType";
import { reactive } from "vue";

export default function useDialog() {
    //定义弹框属性
    const dialog = reactive<DialogModel>({
        title: '标题',
        visible: false,
        height: 280,
        width: 630
    })
    //弹框的确定
    const onConfirm = () => {
        dialog.visible = false
    }
    //弹框显示
    const onShow = () => {
        dialog.visible = true
    }
    //弹框取消
    const onClose = () => {
        dialog.visible = false
    }
    return {
        dialog,
        onClose,
        onConfirm,
        onShow
    }
}
import { onBeforeUnmount, ref, shallowRef, onMounted } from "vue";
export default function useEditor() {
    // 编辑器实例，必须用 shallowRef
    const editorRef = shallowRef();
    const mode = ref('default') // 或 'simple'
    // 内容 HTML
    const valueHtml = ref("");
    // 组件销毁时，也及时销毁编辑器
    onBeforeUnmount(() => {
        const editor = editorRef.value;
        if (editor == null) return;
        editor.destroy();
    });
    const toolbarConfig = {};
    const editorConfig = { placeholder: "请输入内容..." };
    const handleCreated = (editor: any) => {
        editorRef.value = editor; // 记录 editor 实例，重要！
    };
    return{
        editorRef,
        valueHtml,
        toolbarConfig,
        editorConfig,
        handleCreated,
        mode
    }
}
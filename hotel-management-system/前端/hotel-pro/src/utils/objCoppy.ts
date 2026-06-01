//把obj1里面的数据快速复制到obj2里面
export default function objCoppy(obj1: any, obj2: any) {
    Object.keys(obj2).forEach(key => {
        obj2[key] = obj1[key]
    })
}
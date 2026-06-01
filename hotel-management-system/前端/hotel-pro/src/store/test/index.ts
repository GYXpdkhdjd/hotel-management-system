import { defineStore } from 'pinia'
//定义store
export const testStore = defineStore('testStore', {
    //state
    state: () => {
        return {
            count: 0
        }
    },
    //getters
    getters:{
        getCount(state){
            return state.count;
        }
    },
    //actions : 不能使用箭头函数
    actions:{
        setCount(count:number){
            this.count = count;
        }
    }
})
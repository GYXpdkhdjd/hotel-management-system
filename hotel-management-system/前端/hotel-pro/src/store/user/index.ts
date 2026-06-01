import { getInfoApi } from '@/api/login'
import { defineStore } from 'pinia'
//定义store
export const userStore = defineStore('userStore',{
    state:()=>{
        return{
            userId:'',
            token:'',
            name:'',
            codeList:[]
        }
    },
    getters:{
        getUserId(state){
            return state.userId
        },
        getToken(state){
            return state.token
        }
    },
    actions:{
        setUserId(userId:string){
            this.userId = userId;
        },
        setToken(token:string){
            this.token = token;
        },
        getInfo(){
            return new Promise((resolve,reject)=>{
                getInfoApi(this.userId).then((res)=>{
                    if(res && res.code == 200){
                        this.codeList = res.data.permissons
                        this.name = res.data.name
                    }
                    resolve(this.codeList)
                }).catch((error) => {
                    reject(error)
                })
            })
        }
    },
    persist: {
        enabled: true,
        strategies: [
            { storage: localStorage, paths: ['token', 'userId'] },
        ],
    }
})
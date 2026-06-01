import router from "./router";
import { userStore } from "./store/user";
import { menuStore } from "./store/menu";
//白名单
const whiteList = ['/login']
router.beforeEach(async(to,from,next)=>{
    const ustore = userStore()
    const mstore = menuStore()
    //获取token
    const token = ustore.getToken;
    if(token){
        //判断是否是首页来的
        if(to.path === '/login' || to.path === '/'){
            next({path:'/'})
        }else{
            const hasRoles = ustore.codeList.length > 0
            if(hasRoles){
                next()
            }else{ //不存在
                try{
                    //获取用户的信息
                    await ustore.getInfo()
                    //生成动态路由
                    await mstore.getMenuRouter(router,ustore.getUserId)
                    //等待路由全部挂载
                    next({ ...to, replace: true })
                }catch(error){
                    localStorage.clear()
                    next({path:'/login'})
                }
            }
        }
    }else{
        //判断是否在白名单中
        if(whiteList.indexOf(to.path) !== -1){ //存在：放行
            next()
        }else{ //不存在，跳转登录
            next({path:'/login'})
        }
    }
})
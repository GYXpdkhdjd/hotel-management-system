import { createApp } from 'vue'
import App from './App.vue'
import router from './router/index'
import piniaPersist from 'pinia-plugin-persist'
import hasPerm from './permission/hasParm'
//element-plus
import ElementPlus from 'element-plus'
import 'element-plus/dist/index.css'
import * as ElementPlusIconsVue from '@element-plus/icons-vue'
import zhCn from 'element-plus/es/locale/lang/zh-cn'
//引入确定弹性
import myconfirm from './utils/myconfirm'
import objCoppy from './utils/objCoppy'
//引入Pinia构造函数
import { createPinia } from 'pinia'
// 实例化 Pinia
const pinia = createPinia()
//使用持久化插件
pinia.use(piniaPersist)
const app = createApp(App);
app.use(router).use(ElementPlus, {
  locale: zhCn,
}).use(pinia).mount('#app')
//注册图标组件
for (const [key, component] of Object.entries(ElementPlusIconsVue)) {
    app.component(key, component)
  }
  //全局挂载
  app.config.globalProperties.$myconfirm = myconfirm
  app.config.globalProperties.$objCoppy = objCoppy
  app.config.globalProperties.$hasPerm = hasPerm
  import './permission'
import http from '../common/http.js'
//小程序登录
export const wxLoginApi = (code)=>{
	return http.post("/wxapi/user/wxLogin",{code:code})
}
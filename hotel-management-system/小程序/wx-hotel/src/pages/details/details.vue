<template>
	<view style="margin-bottom: 100px;">
		<u-swiper height='350' :list="list"></u-swiper>
		<view class="u-p-30">
			<view class="u-m-b-20">
				<u-tag mode="dark" text='商家自营' bg-color='#FF7670'></u-tag>
				<text class="u-font-24 u-m-l-20 u-type-info-dark">商家自营 放心入住</text>
			</view>
			<view class="u-font-36 u-m-b-20">
				{{title}}
			</view>
			<view class="u-m-b-20">
				<text class="price">￥{{price}}</text>
			</view>
			<u-gap height="20" bg-color="#F5F5F5"></u-gap>
			<view class="book" @click="show=true">
				<text>{{showCode}}</text>
				<u-icon name="arrow-right"></u-icon>
			</view>
			<u-gap height="20" bg-color="#F5F5F5"></u-gap>
			<view class="service">
				<u-checkbox-group>
					<u-checkbox disabled v-model="item.checked" v-for="(item, index) in service" :key="index"
						:name="item.name">{{item.name}}</u-checkbox>
				</u-checkbox-group>
			</view>
			<u-gap height="20" bg-color="#F5F5F5"></u-gap>
			<u-divider color="#0eb6ff" height='60' class='u-m-t-20'>详情</u-divider>
			<u-parse :html="details"></u-parse>
		</view>
	</view>
	<u-popup v-model="show" mode="bottom" height="70%" border-radius='20'>
		<view>
			<view class="u-p-30" style="margin-bottom: 100px;">
				<view class="u-text-center u-font-30">
					选择房间
				</view>
				<view class="u-flex u-m-b-20 u-flex-wrap">
					<view :class="{ active: gather.indexOf(item.roomId) > -1 }" v-for="(item,index) in roomList"
						:key="index" @click="onPatch(item.roomId)" class="num-item">
						{{item.roomCode}}
					</view>
				</view>
			</view>
			<view class="btns">
				<button style='width: 90%;background-color: #009688;' class="" type="primary"
					@click="showBtn">确定</button>
			</view>
		</view>
	</u-popup>
	<view class="btns">
		<button @click="goToInfo" style="background-color: #0eb6ff;" class="bts" type="primary">立即预订</button>
	</view>
</template>

<script setup>
	import {
		computed,
		reactive,
		ref
	} from 'vue'
	import {
		onLoad
	} from '@dcloudio/uni-app';
	import {
		getInfoByIdApi
	} from '../../api/home.js'
	import {
		wxLoginApi
	} from '../../api/user.js'
	const title = ref('')
	const price = ref('')
	const details = ref('')
	//轮播图数据
	const list = ref([])
	//服务数据
	const service = ref([])
	const roomList = ref([])
	//弹框显示
	const show = ref(false)
	//选中数据
	const gather = ref([])
	const stringList = ref(null)
	
	//房间点击事件
	const onPatch = (roomId) => {
		//indexOf:返回某个指定的字符串值在字符串中首次出现的位
		let subscript = gather.value.indexOf(roomId)
		if (subscript > -1) {
			//splice:用于删除数组中的元素
			gather.value.splice(subscript, 1)
		} else {
			gather.value.push(roomId)
		}
		stringList.value = gather.value.join(',')
		console.log(stringList.value)
	}
	//跳转的数据
	const toData = reactive({
		roomId: [],
		roomCode: [],
		roomCount: 0
	})
	const showCode = computed(()=>{
		return toData.roomCode.length > 0 ? '已选择编号'+toData.roomCode.join(',') : '请选择房间号'
	})
	//确定选择房间
	const showBtn = ()=>{
		show.value = false;
		toData.roomId = []
		toData.roomCode = []
		//设置提交的数据
		toData.roomId = gather.value;
		toData.roomCount = gather.value.length;
		//获取房间编号
		gather.value.map((item) => {
			let index = roomList.value.findIndex(dom => dom.roomId == item)
			toData.roomCode.push(roomList.value[index].roomCode)
		})
	}
	//跳转到确定页面
	const goToInfo = () => {
		//判断是否选择房间
		if (toData.roomId.length == 0) {
			uni.showToast({
				icon: 'none',
				title: '请选择房间',
				duration: 2000
			});
			return;
		}
		uni.navigateTo({
			url: '../info/info?infos=' + JSON.stringify(toData)
		});
	}
	
	//获取详情
	const getInfoById = async (infoId) => {
		let {
			data
		} = await getInfoByIdApi(infoId)
		console.log(data)
		list.value = data.imgUrl
		service.value = data.service
		roomList.value = data.roomList
		title.value = data.infoName
		price.value = data.infoPrice
		details.value = data.infoDetails
	}
	//获取code
	const getCode = () => {
		const promise = new Promise((resolve, reject) => {
			uni.login({
				provider: 'weixin',
				success: function(loginRes) {
					if (loginRes && loginRes.code) {
						resolve(loginRes.code)
					} else {
						reject(loginRes)
					}
				}
			});
		}).catch(res => {
			uni.showToast({
				icon: 'none',
				title: res.errMsg || '获取code失败',
				duration: 2000
			});
		})
		return promise;
	}
	//登录
	const userLogin = async () => {
		//获取code
		let res = await getCode()
		//登录
		const {
			data
		} = await wxLoginApi(res)
		console.log(data)
		if (data) {
			uni.setStorageSync('openid', data.openid);
			uni.setStorageSync('sessionKey', data.sessionKey);
		}
	}
	onLoad((options) => {
		console.log(options.infoId)
		getInfoById(options.infoId)
		userLogin()
	})
</script>

<style lang="scss">
	.price {
		color: #FF7670;
	}

	.book {
		display: flex;
		justify-content: space-between;
		align-items: center;
		padding: 25rpx 0rpx;
	}

	.service {
		padding: 25rpx 0rpx;
	}

	.num-item {
		padding: 15rpx 35rpx;
		background: #EFEFEF;
		margin: 5px;
		border-radius: 5px;
	}

	.active {
		padding: 15rpx 35rpx;
		background: #009688;
		margin: 5px;
		border-radius: 5px;
		color: #FFF;
	}

	.btns {
		position: fixed;
		bottom: 0px;
		z-index: 1;
		width: 100%;
		background: #FFFFFF;
		height: 120rpx;
	}

	.bts {
		background-color: #009688 !important;
		width: 90%;
	}
</style>

<template>
	<view class="content">
		<swiper class="swipper-container" circular :indicator-dots="indicatorDots" :autoplay="autoplay"
			:interval="interval" :duration="duration">
			<swiper-item @click="toDetails(item.infoId)" v-for="(item,index) in swipperList" :key='index'>
				<image class="imgs" :src='item.images'></image>
			</swiper-item>
			<!-- <swiper-item>
				<image class="imgs" src='/static/swiper2.png'></image>
			</swiper-item>
			<swiper-item>
				<image class="imgs" src='/static/swiper3.png'></image>
			</swiper-item> -->
		</swiper>
		<!-- 分割线 -->
		<u-divider color="#fa3534" class='divider'>店长推荐</u-divider>
		<view class="wrap">
			<u-waterfall v-model="flowList.list" ref="uWaterfall">
				<template v-slot:left="{leftList}">
					<view @click="toDetails(item.infoId)" class="demo-warter" v-for="(item, index) in leftList" :key="index">
						<!-- 警告：微信小程序中需要hx2.8.11版本才支持在template中结合其他组件，比如下方的lazy-load组件 -->
						<u-lazy-load threshold="-450" border-radius="10" :image="item.imgUrl.split(',')[0]" :index="index">
						</u-lazy-load>
						<view class="demo-title">
							{{item.infoName}}
						</view>
						<view class="demo-price">
							{{item.infoPrice}}元
						</view>
						<view class="demo-tag">
							<view class="demo-tag-owner">
								自营
							</view>
							<view class="demo-tag-text">
								放心购
							</view>
						</view>
					</view>
				</template>
				<template v-slot:right="{rightList}">
					<view @click="toDetails(item.infoId)" class="demo-warter" v-for="(item, index) in rightList" :key="index">
						<u-lazy-load threshold="-450" border-radius="10" :image="item.imgUrl.split(',')[0]" :index="index">
						</u-lazy-load>
						<view class="demo-title">
							{{item.infoName}}
						</view>
						<view class="demo-price">
							{{item.infoPrice}}元
						</view>
						<view class="demo-tag">
							<view class="demo-tag-owner">
								自营
							</view>
							<view class="demo-tag-text">
								放心购
							</view>
						</view>
					</view>
				</template>
			</u-waterfall>
			<!-- <u-loadmore bg-color="rgb(240, 240, 240)" :status="loadStatus" @loadmore="addRandomData"></u-loadmore> -->
		</view>
	</view>
</template>

<script setup>
	import {
		onLoad
	} from '@dcloudio/uni-app';
	import {
		ref,
		reactive
	} from 'vue'
	import {getSwapperListApi,getHotListApi} from '../../api/home.js'
	//是否显示面板指示点
	const indicatorDots = ref(true)
	//是否自动播放
	const autoplay = ref(true)
	//自动切换时间间隔
	const interval = ref(2000)
	//滑动动画时长
	const duration = ref(500)
	//接收轮播图的数据
	const swipperList = ref([])
	//获取轮播图数据
	const getSwapperList = async()=>{
		let {data} = await getSwapperListApi()
		console.log(data)
		swipperList.value = data;
	}
	//列表数据
	const flowList = reactive({
		list: []
	})
	//获取热推数据
	const getHotList = async()=>{
		let {data} = await getHotListApi()
		console.log(data)
		flowList.list = data;
	}
	//跳转详情
	const toDetails = (infoId)=>{
		//在起始页面跳转到details.vue页面并传递参数
		uni.navigateTo({
			url: '../details/details?infoId='+infoId
		});
	}
	//获取数据，放到onLoad里面
	onLoad(()=>{
		getSwapperList()
		getHotList()
	})
</script>

<style lang="scss" scoped>
	.content {
		display: flex;
		flex-direction: column;
	}

	/* 设置轮播图容器高度 */
	.swipper-container {
		height: 150px;
	}

	/* 设置swipper-container元素下面的item样式 */
	.swipper-container .item {
		height: 100%;
		text-align: center;
		line-height: 150px;
	}

	/* 设置第1个swiper-item下的item元素的背景色 */
	swiper-item:nth-child(1) .item {
		background-color: bisque;
	}

	/* 设置第2个swiper-item下的item元素的背景色 */
	swiper-item:nth-child(2) .item {
		background-color: pink;
	}

	/* 设置第3个swiper-item下的item元素的背景色 */
	swiper-item:nth-child(3) .item {
		background-color: burlywood;
	}

	.imgs {
		height: 400rpx;
		width: 100%;
	}

	.divider {
		padding-top: 10px;
		font-size: 32rpx;
	}

	.wrap {
		padding: 0px 5px;
	}

	.demo-warter {
		border-radius: 8px;
		// margin: 5px;
		background-color: #ffffff;
		padding: 5px;
		position: relative;
	}

	.u-close {
		position: absolute;
		top: 32rpx;
		right: 32rpx;
	}

	.demo-image {
		width: 100%;
		border-radius: 4px;
	}

	.demo-title {
		font-size: 30rpx;
		margin-top: 5px;
		color: $u-main-color;
	}

	.demo-tag {
		display: flex;
		margin-top: 5px;
	}

	.demo-tag-owner {
		background-color: $u-type-error;
		color: #FFFFFF;
		display: flex;
		align-items: center;
		padding: 4rpx 14rpx;
		border-radius: 50rpx;
		font-size: 20rpx;
		line-height: 1;
	}

	.demo-tag-text {
		border: 1px solid $u-type-primary;
		color: $u-type-primary;
		margin-left: 10px;
		border-radius: 50rpx;
		line-height: 1;
		padding: 4rpx 14rpx;
		display: flex;
		align-items: center;
		border-radius: 50rpx;
		font-size: 20rpx;
	}

	.demo-price {
		font-size: 30rpx;
		color: $u-type-error;
		margin-top: 5px;
	}

	.demo-shop {
		font-size: 22rpx;
		color: $u-tips-color;
		margin-top: 5px;
	}
</style>

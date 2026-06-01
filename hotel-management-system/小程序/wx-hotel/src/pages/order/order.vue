<template>
	<view>
		<view class="wrap">
			<view class="u-tabs-box">
				<u-tabs-swiper activeColor="#f29100" ref="tabs" :list="list" :current="currents" @change="change"
					:is-scroll="false" swiperWidth="750"></u-tabs-swiper>
			</view>
			<swiper class="swiper-box" :current="swiperCurrent" @transition="transition"
				@animationfinish="animationfinish">
				<swiper-item  v-for='(item,index) in list' :key='index' class="swiper-item">
					<scroll-view scroll-y style="height: 100%;width: 100%;" @scrolltolower="reachBottom">
						<view class="page-box">
							<view class="order" v-for="(res, index1) in orderList[index]" :key="res.orderId">
								<view class="top">
									<view class="left">
										<u-icon name="home" :size="30" color="rgb(94,94,94)"></u-icon>
										<view class="store">{{ res.infoName }}</view>
										<u-icon name="arrow-right" color="rgb(203,203,203)" :size="26"></u-icon>
									</view>
									<view class="right">{{ status[res.status-1] }}</view>
								</view>
								<view class="item">
									<view class="left">
										<image :src="res.imgUrl.split(',')[0]" mode="aspectFill"></image>
									</view>
									<view class="content">
										<view class="title u-line-2"><span
												style='font-weight: bold;margin-right: 5px;'>姓名:</span>{{ res.name }}
										</view>
										<view class="title u-line-2"><span
												style='font-weight: bold;margin-right: 5px;'>电话:</span>{{ res.phone }}
										</view>
										<view class="title u-line-2"><span
												style='font-weight: bold;margin-right: 5px;'>房间号:</span>{{ res.roomCode }}
										</view>
										<view class="title u-line-2"><span
												style='font-weight: bold;margin-right: 5px;'>到店时间:</span>{{ res.bookTime }}
										</view>
									</view>
								</view>
							</view>
							<u-loadmore :status="loadStatus[index]" bgColor="#f2f2f2"></u-loadmore>
						</view>
					</scroll-view>
				</swiper-item>
			</swiper>
		</view>
	</view>
</template>

<script setup>
	import {getOrderListApi} from '../../api/home.js'
	import {
		onReady
	} from '@dcloudio/uni-app';
	import {
		ref,
		computed
	} from 'vue'
	const tabs = ref(null);
	const list = ref([{
			name: '全部'
		},
		{
			name: '已预订'
		},
		{
			name: '已入住'
		},
		{
			name: '已退房'
		}
	])
	const orderList = ref([
			[],
			[],
			[],
			[]
		])
	const dataList = ref([{
		orderId: 1,
		infoName: '标准单人间',
		deal: '预订成功',
		imgUrl: '/static/swiper1.png',
		roomCode: '101,102',
		name: '张三',
		phone: '18787171906',
		bookTime: '2022-09-15'
	}, {
		orderId: 2,
		infoName: '标准双人间',
		deal: '预订成功',
		imgUrl: '/static/swiper2.png',
		roomCode: '201,202',
		name: '李四',
		phone: '18787171906',
		bookTime: '2022-09-15'
	}])
	const status = ref(['预订成功','已入住','退房'])
	const currents = ref(0)
	const swiperCurrent = ref(0)
	const tabsHeight = ref(0)
	const dx = ref(0)
	const pageSize = ref(3)
	const currentPage = ref(1)
	//总页数
	const pages = ref(0)
	const loadStatus = ref(['loadmore', 'loadmore', 'loadmore', 'loadmore'])

	// const getOrderList = (idx) => {
	// 	for (let i = 0; i < 5; i++) {
	// 		let index = Math.round(Math.random() * (dataList.value.length - 1));
	// 		let data = JSON.parse(JSON.stringify(dataList.value[index]));
	// 		data.id = Math.floor(Math.random() * 100 + 1);
	// 		orderList.value[idx].push(data);
	// 	}
	// 	loadStatus.value.splice(currents.value, 1, "loadmore")
	// }
	//触底事件
	const reachBottom = () => {
		loadStatus.value.splice(currents.value, 1, "loading")
		setTimeout(() => {
			if(currentPage.value < pages.value){
				currentPage.value = ++currentPage.value
				getOrderList(currents.value);
			}else{
				loadStatus.value.splice(currents.value, 1, "nomore")
			}
			
		}, 500);
	}
	//tabs的点击事件
	const change = (index) => {
		loadStatus.value.splice(index, 1, "loading")
		currentPage.value = 1;
		pages.value = 0;
		orderList.value[currents.value] = []
		swiperCurrent.value = index;
	}
	
	const transition = ({detail: {dx}}) => {
		tabs.value.setDx(dx);
	}
	
	const animationfinish = ({detail: {current}}) => {
		console.log('滑动')
		tabs.value.setFinishCurrent(current);
		swiperCurrent.value = current;
		currents.value = current;
		currentPage.value = 1;
		pages.value = 0;
		orderList.value[currents.value] = []
		getOrderList(current);
	}
	//获取数据
	const getOrderList = async(idx)=>{
		let res = await getOrderListApi({
			openid:uni.getStorageSync("openid"),
			type:idx == 0 ? '' : idx,
			currentPage:currentPage.value,
			pageSize:pageSize.value
		})
		if(res && res.code == 200){
			//没有查询到数据
			if(res.data.records.length == 0){
				loadStatus.value.splice(idx, 1, "nomore")
				return;
			}
			pages.value = res.data.pages;
			//设置列表数据
			res.data.records.map(item =>{
				orderList.value[idx].push(item)
			})
		}
		loadStatus.value.splice(currents.value, 1, "loadmore")
	}
	onReady(() => {
		getOrderList(currents.value);
	})
</script>

<style>
	/* #ifndef H5 */
	page {
		height: 100%;
		background-color: #f2f2f2;
	}

	/* #endif */
</style>

<style lang="scss" scoped>
	.order {
		width: 710rpx;
		background-color: #ffffff;
		margin: 20rpx auto;
		border-radius: 20rpx;
		box-sizing: border-box;
		padding: 20rpx;
		font-size: 28rpx;

		.top {
			display: flex;
			justify-content: space-between;

			.left {
				display: flex;
				align-items: center;

				.store {
					margin: 0 10rpx;
					font-size: 32rpx;
					font-weight: bold;
				}
			}

			.right {
				color: $u-type-warning-dark;
			}
		}

		.item {
			display: flex;
			margin: 20rpx 0 0;

			.left {
				margin-right: 20rpx;

				image {
					width: 200rpx;
					height: 200rpx;
					border-radius: 10rpx;
				}
			}

			.content {
				.title {
					font-size: 28rpx;
					line-height: 50rpx;
				}

				.type {
					margin: 10rpx 0;
					font-size: 24rpx;
					color: $u-tips-color;
				}

				.delivery-time {
					color: #e5d001;
					font-size: 24rpx;
				}
			}

			.right {
				margin-left: 10rpx;
				padding-top: 20rpx;
				text-align: right;

				.decimal {
					font-size: 24rpx;
					margin-top: 4rpx;
				}

				.number {
					color: $u-tips-color;
					font-size: 24rpx;
				}
			}
		}

		.total {
			margin-top: 20rpx;
			text-align: right;
			font-size: 24rpx;

			.total-price {
				font-size: 32rpx;
			}
		}

		.bottom {
			display: flex;
			margin-top: 40rpx;
			padding: 0 10rpx;
			justify-content: space-between;
			align-items: center;

			.btn {
				line-height: 52rpx;
				width: 160rpx;
				border-radius: 26rpx;
				border: 2rpx solid $u-border-color;
				font-size: 26rpx;
				text-align: center;
				color: $u-type-info-dark;
			}

			.evaluate {
				color: $u-type-warning-dark;
				border-color: $u-type-warning-dark;
			}
		}
	}

	.centre {
		text-align: center;
		margin: 200rpx auto;
		font-size: 32rpx;

		image {
			width: 164rpx;
			height: 164rpx;
			border-radius: 50%;
			margin-bottom: 20rpx;
		}

		.tips {
			font-size: 24rpx;
			color: #999999;
			margin-top: 20rpx;
		}

		.btn {
			margin: 80rpx auto;
			width: 200rpx;
			border-radius: 32rpx;
			line-height: 64rpx;
			color: #ffffff;
			font-size: 26rpx;
			background: linear-gradient(270deg, rgba(249, 116, 90, 1) 0%, rgba(255, 158, 1, 1) 100%);
		}
	}

	.wrap {
		display: flex;
		flex-direction: column;
		height: calc(100vh - var(--window-top));
		width: 100%;
	}

	.swiper-box {
		flex: 1;
	}

	.swiper-item {
		height: 100%;
	}
</style>

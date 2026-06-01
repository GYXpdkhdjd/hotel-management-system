<template>
	<view class="userinfo">
		<view class="img-container">
			<image class="uimage" :src='avatarUrl'></image>
		</view>
		<!-- 分割线 -->
		<u-divider>{{nickName}}</u-divider>
	</view>
	<view class="ment-item" @click="toOrder">
		<view class="">
			<u-icon name='order'></u-icon>
			<text class="item-text">我的订单</text>
		</view>
		<view class="">
			<u-icon name='arrow-right'></u-icon>
		</view>
	</view>
	<view class="ment-item" @click="toSuggest">
		<view class="">
			<u-icon name='edit-pen'></u-icon>
			<text class="item-text">意见反馈</text>
		</view>
		<view class="">
			<u-icon name='arrow-right'></u-icon>
		</view>
	</view>
	<view class="ment-item" @click="toAbout">
		<view class="">
			<u-icon name='order'></u-icon>
			<text class="item-text">关于我们</text>
		</view>
		<view class="">
			<u-icon name='arrow-right'></u-icon>
		</view>
	</view>
</template>

<script setup>
	import {onLoad} from '@dcloudio/uni-app'
	import {
		ref
	} from 'vue'
	//昵称
	const nickName = ref('大幕孤烟直')
	//头像
	const avatarUrl = ref('/static/user.jpg')
	//跳转订单
	const toOrder = () => {
		if(!uni.getStorageSync('avatarUrl') || !uni.getStorageSync('nickName')){
			uni.getUserProfile({
				desc: '用于头像昵称展示', // 声明获取用户个人信息后的用途，后续会展示在弹窗中，请谨慎填写
				success: (res) => {
					console.log(res)
					nickName.value = res.userInfo.nickName
					avatarUrl.value = res.userInfo.avatarUrl
					uni.setStorageSync('avatarUrl', res.userInfo.avatarUrl);
					uni.setStorageSync('nickName', res.userInfo.nickName);
				}
			})
		}
		//在起始页面跳转到details.vue页面并传递参数
		uni.navigateTo({
			url: '../order/order'
		});
	}
	//跳转反馈页面
	const toSuggest = () => {
		//在起始页面跳转到details.vue页面并传递参数
		uni.navigateTo({
			url: '../suggest/suggest'
		});
	}
	//跳转反馈页面
	const toAbout = () => {
		//在起始页面跳转到details.vue页面并传递参数
		uni.navigateTo({
			url: '../about/about'
		});
	}
	//获取头像点击事件
	const getUserInfo = () => {
		if(uni.getStorageSync('avatarUrl') && uni.getStorageSync('nickName')){
			nickName.value = uni.getStorageSync('nickName')
			avatarUrl.value = uni.getStorageSync('avatarUrl')
		}
	}
	onLoad(()=>{
		getUserInfo()
	})
</script>

<style lang="scss">
	.userinfo {
		margin: 30rpx 0rpx;
	}

	.img-container {
		display: flex;
		justify-content: center;
		align-items: center;
	}

	.uimage {
		height: 50px;
		width: 50px;
		border-radius: 50%;
		margin: 5px 0px;
	}

	.ment-item {
		display: flex;
		align-items: center;
		justify-content: space-between;
		font-size: 28rpx;
		padding: 15px 20px;
		background-color: #FEFEFE;
		border-bottom: 1px solid #EFEFEF;
	}

	.item-text {
		margin-left: 10rpx;
	}
</style>

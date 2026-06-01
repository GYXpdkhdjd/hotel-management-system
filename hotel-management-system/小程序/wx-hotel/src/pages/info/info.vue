<template>
	<view class="u-p-30">
		<u-divider height='60' fontSize='32' class='u-m-t-20'>预订信息</u-divider>
		<u-form labelPosition="left" labelWidth='140' :model="addModel" ref="uForm">
			<u-form-item label="房间:">
				<u-input v-model="addModel.roomCode" />
			</u-form-item>
			<u-form-item label="数量:">
				<u-input v-model="addModel.roomCount" />
			</u-form-item>
			<u-form-item label="姓名:">
				<u-input v-model="addModel.name" />
			</u-form-item>
			<u-form-item label="电话:">
				<u-input v-model="addModel.phone" />
			</u-form-item>
			<u-form-item label="到店时间:">
				<uni-datetime-picker :border="false" v-model="addModel.bookTime" />
			</u-form-item>
		</u-form>
		<view class="btns">
			<button @click="commit" class="bts" type="primary">确定预订</button>
		</view>
	</view>
</template>

<script setup>
	import {
		reactive,
		ref
	} from 'vue'
	import {
		onLoad
	} from '@dcloudio/uni-app';
	import {bookOrderApi} from '../../api/home.js'
	const addModel = reactive({
		openid: uni.getStorageSync('openid'),
		name: '',
		phone: '',
		roomId: '',
		roomCode: '',
		roomCount: 0,
		bookTime: ''
	})
	onLoad((options) => {
		console.log(options)
		const parm = JSON.parse(options.infos)
		addModel.roomId = parm.roomId.join(",")
		addModel.roomCode = parm.roomCode.join(",")
		addModel.roomCount = parm.roomCount
		console.log(addModel)
	})
	//提交数据
	const commit = async() => {
		console.log(addModel)
		if (!addModel.name) {
			uni.showToast({
				icon: 'none',
				title: '请填写姓名',
				duration: 2000
			});
			return;
		}
		if (!addModel.phone) {
			uni.showToast({
				icon: 'none',
				title: '请填写电话',
				duration: 2000
			});
			return;
		}
		if (!addModel.bookTime) {
			uni.showToast({
				icon: 'none',
				title: '请选择到店时间',
				duration: 2000
			});
			return;
		}
		const res = await bookOrderApi(addModel)
		console.log(res)
		if(res && res.code == 200){
			uni.redirectTo({
				url: '../order/order'
			});
		}
	}
</script>

<style>
	.btns {
		margin-top: 60px;
		width: 100%;
		background: #FFFFFF;
		height: 120rpx;
	}

	.bts {
		width: 90%;
		background-color: #009688 !important;
	}
</style>

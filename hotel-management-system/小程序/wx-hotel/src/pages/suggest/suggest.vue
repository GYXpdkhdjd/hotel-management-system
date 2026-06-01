<template>
	<view class="u-p-30">
		<u-form :model="suggest" ref="uForm">
			<u-form-item label="标题">
				<u-input v-model="suggest.title" />
			</u-form-item>
			<u-form-item label="意见">
				<u-input type='textarea' height="300" border v-model="suggest.context" />
			</u-form-item>
		</u-form>
	</view>
	<view class="u-m-t-20 u-p-40">
		<button type="primary" @click="commit">提交</button>
	</view>
</template>

<script setup>
	import {addSuggestApi} from '../../api/home.js'
	import {
		reactive
	} from 'vue'
	//表单对象
	const suggest = reactive({
		title: '',
		context: '',
		openid: uni.getStorageSync('openid')
	})
	//表单提交
	const commit = async() => {
		if (!suggest.title) {
			uni.showToast({
				title: '请填写标题',
				duration: 2000
			});
		}
		if (!suggest.context) {
			uni.showToast({
				title: '请填写内容',
				duration: 2000
			});
		}
		const res = await addSuggestApi(suggest)
		if(res && res.code == 200){
			uni.showToast({
				title: res.msg,
				duration: 2000
			});
			uni.navigateBack()
		}
	}
</script>

<style>

</style>

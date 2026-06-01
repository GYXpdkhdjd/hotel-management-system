<template>
  <div>22222</div>
  <el-button type="primary" size="default" @click="addBtn">新增</el-button>
  <el-icon :size="20">
    <Edit />
  </el-icon>
  <el-icon color="#409EFC" class="no-inherit">
    <Share />
  </el-icon>
  <el-icon>
    <Delete />
  </el-icon>
  <div>{{ count }}</div>
</template>
<script setup lang="ts">
import { computed } from "vue";
import { storeToRefs } from "pinia";
import { testStore } from "@/store/test/index";
//获取store
const store = testStore();

//获取store里面的count,解构的方式，会是数据失去响应性
//storeToRefs
// const { count } = storeToRefs(store);

//computed
const count = computed(() => {
  return store.getCount;
});

const addBtn = () => {
  //方式一
  // store.count++;
  //方式二
  // store.setCount(++store.count)
  //方式三
  // store.$patch({
  //   count: ++store.count,
  // });
  //方式四
  store.$patch((state) => {
    state.count = ++state.count;
  });
};
</script>

<style scoped></style>

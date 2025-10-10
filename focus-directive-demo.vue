<template>
  <div>
    <h1>Vue 自定义指令示例</h1>
    <input type="text" v-focus placeholder="加载后会自动聚焦">
    <p>这个输入框在页面加载后会自动获得焦点。</p>
  </div>
</template>

<script setup>
// 定义一个局部自定义指令
const vFocus = {
  mounted: (el) => {
    el.focus();
  }
}
</script>

<style scoped>
div {
  padding: 20px;
  font-family: Arial, sans-serif;
}

input {
  padding: 8px;
  margin: 10px 0;
  border: 1px solid #ccc;
  border-radius: 4px;
}

input:focus {
  border-color: #409eff;
  outline: none;
}
</style>
<template>
  <div>
    <h2>Vue 自定义指令 - 聚焦输入框</h2>
    <input type="text" v-focus placeholder="页面加载后，这个输入框会自动获得焦点">
  </div>
</template>

<script>
export default {
  name: 'FocusInputDirective',
  directives: {
    // 定义一个名为 'focus' 的局部自定义指令
    focus: {
      // 当被绑定的元素挂载到 DOM 上时...
      mounted(el) {
        // 聚焦元素
        el.focus();
      }
    }
  }
}
</script>

<style scoped>
input {
  padding: 8px;
  font-size: 16px;
  margin-top: 10px;
}
</style>
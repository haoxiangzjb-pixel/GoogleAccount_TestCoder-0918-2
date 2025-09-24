<template>
  <div>
    <h2>Vue 自定义指令示例 - 聚焦输入框</h2>
    <input type="text" v-focus placeholder="这个输入框会在挂载时自动聚焦">
    <br><br>
    <input type="text" placeholder="这个不会自动聚焦">
  </div>
</template>

<script>
export default {
  name: 'FocusInputDirective',
  directives: {
    // 定义一个名为 'focus' 的局部自定义指令
    focus: {
      // 在绑定元素的父组件被挂载后调用
      mounted(el) {
        // 聚焦元素
        el.focus();
      }
    }
  }
}
</script>

<style scoped>
div {
  padding: 20px;
}
input {
  padding: 8px;
  margin: 5px;
  border: 1px solid #ccc;
  border-radius: 4px;
}
</style>
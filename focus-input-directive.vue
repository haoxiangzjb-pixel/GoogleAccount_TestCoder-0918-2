<template>
  <div>
    <h2>Vue 自定义指令示例 - 自动聚焦</h2>
    <input type="text" v-focus placeholder="这个输入框应该会自动获得焦点">
    <br><br>
    <input type="text" placeholder="这个不会自动聚焦">
  </div>
</template>

<script>
export default {
  name: 'FocusInputDirective',
  directives: {
    focus: {
      mounted(el) {
        el.focus();
      }
    }
  }
}
</script>

<style scoped>
input {
  padding: 8px;
  margin: 4px;
}
</style>
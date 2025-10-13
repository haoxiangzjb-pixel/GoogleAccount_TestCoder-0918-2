<template>
  <div>
    <h1>Vue 自定义指令示例</h1>
    <input type="text" v-focus placeholder="这个输入框应该自动获得焦点">
    <br><br>
    <input type="text" placeholder="这个输入框没有 v-focus 指令">
  </div>
</template>

<script>
export default {
  name: 'FocusDirectiveDemo',
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
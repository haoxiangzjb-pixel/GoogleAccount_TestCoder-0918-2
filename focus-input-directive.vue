<template>
  <div>
    <h2>Vue 自定义聚焦指令示例</h2>
    <input v-focus type="text" placeholder="这个输入框会在挂载时自动获得焦点" />
    <br><br>
    <input type="text" placeholder="这个输入框没有自动聚焦" />
    <br><br>
    <input v-focus-delay="2000" type="text" placeholder="这个输入框会在2秒后获得焦点" />
  </div>
</template>

<script>
export default {
  name: 'FocusInputDirective',
  directives: {
    // 自定义聚焦指令
    focus: {
      mounted(el) {
        el.focus();
      }
    },
    // 带延迟的聚焦指令
    'focus-delay': {
      mounted(el, binding) {
        setTimeout(() => {
          el.focus();
        }, binding.value || 1000); // 默认1秒延迟
      }
    }
  }
}
</script>

<style scoped>
input {
  padding: 8px;
  margin: 5px;
  border: 1px solid #ccc;
  border-radius: 4px;
}
</style>
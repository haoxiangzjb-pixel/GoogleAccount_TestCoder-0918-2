<template>
  <div>
    <h2>Vue自定义聚焦指令示例</h2>
    <input v-focus type="text" placeholder="这个输入框会在挂载时自动聚焦" />
    <br><br>
    <input type="text" placeholder="这个输入框没有自动聚焦" />
    <br><br>
    <input v-focus-delayed type="text" placeholder="这个输入框会在延迟后聚焦" />
  </div>
</template>

<script>
export default {
  name: 'FocusInputDirective',
  directives: {
    // 基础聚焦指令
    focus: {
      mounted(el) {
        el.focus();
      }
    },
    // 带延迟的聚焦指令
    'focus-delayed': {
      mounted(el) {
        setTimeout(() => {
          el.focus();
        }, 1000);
      }
    }
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
  margin: 10px;
  border: 1px solid #ccc;
  border-radius: 4px;
}
</style>
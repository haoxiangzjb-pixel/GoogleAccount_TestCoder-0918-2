<template>
  <div>
    <h2>Vue 自定义聚焦指令示例</h2>
    <input v-focus type="text" placeholder="这个输入框会自动获得焦点" />
    <br><br>
    <input type="text" placeholder="这个输入框没有自动聚焦" />
    <br><br>
    <input v-focus="{ delay: 2000 }" type="text" placeholder="这个输入框会在2秒后获得焦点" />
  </div>
</template>

<script>
export default {
  name: 'FocusInputDirective',
  directives: {
    // 定义自定义聚焦指令
    focus: {
      mounted(el, binding) {
        // 检查元素是否为输入框或可聚焦元素
        if (el && typeof el.focus === 'function') {
          const delay = binding.value?.delay || 0;
          setTimeout(() => {
            el.focus();
          }, delay);
        }
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
  margin: 5px;
  border: 1px solid #ccc;
  border-radius: 4px;
}
</style>
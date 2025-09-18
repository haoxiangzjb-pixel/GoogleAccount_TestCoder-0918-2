<template>
  <div>
    <p>这是一个使用自定义聚焦指令的示例:</p>
    <input v-focus placeholder="页面加载时我会自动聚焦" />
    <input placeholder="这个不会自动聚焦" />
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
input {
  display: block;
  margin: 10px 0;
  padding: 8px;
}
</style>
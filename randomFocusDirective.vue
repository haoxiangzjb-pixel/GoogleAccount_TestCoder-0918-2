<template>
  <div>
    <h2>Random Focus Directive Example</h2>
    <input v-focus type="text" placeholder="This input will be focused automatically" />
    <br><br>
    <input type="text" placeholder="This input will not be focused" />
  </div>
</template>

<script>
export default {
  name: 'RandomFocusDirective',
  directives: {
    focus: {
      // 当绑定元素插入到DOM中时...
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
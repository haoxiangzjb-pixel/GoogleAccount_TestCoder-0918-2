<template>
  <div>
    <input type="text" v-focus placeholder="This input should be focused on mount" />
    <p>Custom focus directive demo.</p>
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
  padding: 8px;
  margin: 10px;
  border: 1px solid #ccc;
  border-radius: 4px;
}
</style>
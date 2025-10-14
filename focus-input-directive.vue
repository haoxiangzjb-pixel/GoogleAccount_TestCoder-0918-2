<template>
  <div>
    <h2>Custom Focus Directive Example</h2>
    <input v-focus type="text" placeholder="This input should be focused on mount" />
    <br><br>
    <input type="text" placeholder="This input is normal" />
  </div>
</template>

<script setup>
// Define the custom directive
const vFocus = {
  mounted: (el) => {
    el.focus();
  }
};
</script>

<style scoped>
input {
  padding: 8px;
  margin: 4px;
}
</style>
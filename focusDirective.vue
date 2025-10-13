<template>
  <div>
    <h1>Custom Focus Directive Example</h1>
    <input v-focus type="text" placeholder="This should be focused on mount" />
    <br><br>
    <input type="text" placeholder="This is a normal input" />
  </div>
</template>

<script>
export default {
  name: 'FocusDirectiveExample',
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
}
</style>
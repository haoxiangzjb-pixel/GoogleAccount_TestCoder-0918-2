<template>
  <div>
    <h2>Vue Focus Directive Example</h2>
    <input v-focus type="text" placeholder="This input will be focused automatically" />
    <br><br>
    <input type="text" placeholder="This input will not be focused" />
  </div>
</template>

<script>
export default {
  name: 'FocusDirectiveExample',
  directives: {
    focus: {
      // When the bound element is inserted into the DOM...
      mounted(el) {
        // Focus the element
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
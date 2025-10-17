<template>
  <div>
    <h2>Vue Focus Input Directive Example</h2>
    <input v-focus type="text" placeholder="This input will be focused automatically" />
    <br><br>
    <input type="text" placeholder="This input will not be focused automatically" />
    <br><br>
    <input v-focus-if="shouldFocus" type="text" placeholder="This input will be focused conditionally" />
    <br><br>
    <button @click="toggleFocus">Toggle Conditional Focus</button>
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
    // 条件聚焦指令
    focusIf: {
      mounted(el, binding) {
        if (binding.value) {
          el.focus();
        }
      },
      updated(el, binding) {
        if (binding.value) {
          el.focus();
        }
      }
    }
  },
  data() {
    return {
      shouldFocus: true
    };
  },
  methods: {
    toggleFocus() {
      this.shouldFocus = !this.shouldFocus;
    }
  }
};
</script>

<style scoped>
input {
  padding: 8px;
  margin: 5px;
  border: 1px solid #ccc;
  border-radius: 4px;
}
button {
  padding: 8px 12px;
  background-color: #007bff;
  color: white;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}
button:hover {
  background-color: #0056b3;
}
</style>
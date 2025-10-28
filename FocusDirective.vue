<template>
  <div class="container">
    <h2>Vue 自定义聚焦指令示例</h2>
    <input 
      type="text" 
      v-focus 
      placeholder="这个输入框会在挂载时自动获得焦点" 
    />
    <br><br>
    <input 
      type="text" 
      placeholder="这个输入框没有自动聚焦" 
    />
    <br><br>
    <button @click="focusNextInput">聚焦下一个输入框</button>
    <input 
      type="text" 
      v-focus="shouldFocus" 
      placeholder="条件聚焦的输入框" 
      ref="conditionalInput"
    />
  </div>
</template>

<script>
export default {
  name: 'FocusDirective',
  directives: {
    // 定义自定义聚焦指令
    focus: {
      // 在元素挂载后聚焦
      mounted(el, binding) {
        // 如果没有提供参数或参数为真，则聚焦元素
        if (typeof binding.value === 'undefined' || binding.value) {
          el.focus();
        }
      },
      // 当传递的参数更新时触发
      updated(el, binding) {
        if (binding.value) {
          el.focus();
        }
      }
    }
  },
  data() {
    return {
      shouldFocus: false
    }
  },
  methods: {
    focusNextInput() {
      this.shouldFocus = true;
      // 在下一个tick重置，以便可以重复触发聚焦
      this.$nextTick(() => {
        setTimeout(() => {
          this.shouldFocus = false;
        }, 100);
      });
    }
  }
}
</script>

<style scoped>
.container {
  padding: 20px;
  font-family: Arial, sans-serif;
}

input {
  padding: 10px;
  margin: 10px 0;
  border: 1px solid #ccc;
  border-radius: 4px;
  width: 300px;
}

button {
  padding: 10px 15px;
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
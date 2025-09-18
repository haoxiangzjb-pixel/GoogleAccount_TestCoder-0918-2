<template>
  <div class="click-counter">
    <h2>Vue Click Counter</h2>
    <p>Count: {{ count }}</p>
    <button @click="incrementCounter">Click me!</button>
  </div>
</template>

<script>
export default {
  name: 'ClickCounter',
  data() {
    return {
      count: 0
    }
  },
  methods: {
    incrementCounter() {
      this.count++
    }
  }
}
</script>

<style scoped>
.click-counter {
  text-align: center;
  margin: 20px;
  padding: 20px;
  border: 1px solid #ccc;
  border-radius: 8px;
}

button {
  padding: 10px 20px;
  font-size: 16px;
  background-color: #42b983;
  color: white;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

button:hover {
  background-color: #359c6d;
}
</style>
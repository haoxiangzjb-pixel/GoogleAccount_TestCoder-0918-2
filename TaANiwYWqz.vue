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
  padding: 20px;
  font-family: Arial, sans-serif;
}

button {
  background-color: #42b983;
  color: white;
  border: none;
  padding: 10px 20px;
  font-size: 16px;
  cursor: pointer;
  border-radius: 4px;
}

button:hover {
  background-color: #359c6d;
}
</style>
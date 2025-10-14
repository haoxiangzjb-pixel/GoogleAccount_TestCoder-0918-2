<template>
  <div>
    <button @click="count++">Count is: {{ count }}</button>
  </div>
</template>

<script>
export default {
  name: 'CounterButton',
  data() {
    return {
      count: 0
    }
  }
}
</script>

<style scoped>
button {
  padding: 0.5em 1em;
  font-size: 1em;
}
</style>
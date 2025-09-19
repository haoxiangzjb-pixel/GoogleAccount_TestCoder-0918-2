<template>
  <div class="login-form">
    <h2>Вход в систему</h2>
    <form @submit.prevent="handleSubmit">
      <div class="form-group">
        <label for="username">Имя пользователя:</label>
        <input 
          type="text" 
          id="username" 
          v-model="username" 
          required 
          placeholder="Введите имя пользователя"
        />
      </div>
      
      <div class="form-group">
        <label for="password">Пароль:</label>
        <input 
          type="password" 
          id="password" 
          v-model="password" 
          required 
          placeholder="Введите пароль"
        />
      </div>
      
      <button type="submit" :disabled="isLoading">
        <span v-if="isLoading">Вход...</span>
        <span v-else>Войти</span>
      </button>
      
      <div v-if="error" class="error-message">
        {{ error }}
      </div>
    </form>
  </div>
</template>

<script>
export default {
  name: 'LoginForm',
  data() {
    return {
      username: '',
      password: '',
      isLoading: false,
      error: ''
    }
  },
  methods: {
    handleSubmit() {
      // Сброс ошибки перед новой попыткой
      this.error = '';
      
      // Проверка на заполненность полей
      if (!this.username || !this.password) {
        this.error = 'Пожалуйста, заполните все поля';
        return;
      }
      
      // Имитация процесса входа
      this.isLoading = true;
      
      // Имитация API вызова
      setTimeout(() => {
        this.isLoading = false;
        
        // Простая проверка для демонстрации
        if (this.username === 'admin' && this.password === 'password') {
          alert('Вход выполнен успешно!');
          // Здесь обычно будет редирект или обновление состояния приложения
        } else {
          this.error = 'Неверное имя пользователя или пароль';
        }
      }, 1500);
    }
  }
}
</script>

<style scoped>
.login-form {
  max-width: 400px;
  margin: 50px auto;
  padding: 20px;
  border: 1px solid #ddd;
  border-radius: 8px;
  box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
  font-family: Arial, sans-serif;
}

.form-group {
  margin-bottom: 15px;
}

label {
  display: block;
  margin-bottom: 5px;
  font-weight: bold;
}

input {
  width: 100%;
  padding: 10px;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
}

button {
  width: 100%;
  padding: 12px;
  background-color: #007bff;
  color: white;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  font-size: 16px;
}

button:hover:not(:disabled) {
  background-color: #0056b3;
}

button:disabled {
  background-color: #6c757d;
  cursor: not-allowed;
}

.error-message {
  margin-top: 15px;
  padding: 10px;
  background-color: #f8d7da;
  color: #721c24;
  border: 1px solid #f5c6cb;
  border-radius: 4px;
}
</style>
<template>
  <div class="login-form-container">
    <form @submit.prevent="handleSubmit" class="login-form">
      <h2>Вход в систему</h2>
      
      <div class="form-group">
        <label for="email">Email:</label>
        <input 
          type="email" 
          id="email" 
          v-model="email" 
          required 
          placeholder="Введите ваш email"
        />
      </div>
      
      <div class="form-group">
        <label for="password">Пароль:</label>
        <input 
          type="password" 
          id="password" 
          v-model="password" 
          required 
          placeholder="Введите ваш пароль"
        />
      </div>
      
      <div class="form-group">
        <button type="submit" :disabled="isSubmitting">
          {{ isSubmitting ? 'Вход...' : 'Войти' }}
        </button>
      </div>
      
      <div class="form-group">
        <a href="#" @click.prevent="handleForgotPassword">Забыли пароль?</a>
      </div>
    </form>
  </div>
</template>

<script>
export default {
  name: 'LoginForm',
  data() {
    return {
      email: '',
      password: '',
      isSubmitting: false
    }
  },
  methods: {
    async handleSubmit() {
      if (!this.email || !this.password) {
        alert('Пожалуйста, заполните все поля');
        return;
      }
      
      this.isSubmitting = true;
      
      try {
        // Здесь должна быть логика для отправки данных на сервер
        console.log('Отправка данных:', { email: this.email, password: this.password });
        
        // Имитация асинхронного запроса
        await new Promise(resolve => setTimeout(resolve, 1000));
        
        // В реальном приложении здесь будет вызов API
        alert('Вход успешно выполнен (демонстрация)');
      } catch (error) {
        console.error('Ошибка входа:', error);
        alert('Ошибка при входе. Пожалуйста, попробуйте снова.');
      } finally {
        this.isSubmitting = false;
      }
    },
    handleForgotPassword() {
      // Логика восстановления пароля
      alert('Функция восстановления пароля');
    }
  }
}
</script>

<style scoped>
.login-form-container {
  display: flex;
  justify-content: center;
  align-items: center;
  min-height: 100vh;
  background-color: #f5f5f5;
}

.login-form {
  background: white;
  padding: 2rem;
  border-radius: 8px;
  box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
  width: 100%;
  max-width: 400px;
}

.form-group {
  margin-bottom: 1rem;
}

.form-group label {
  display: block;
  margin-bottom: 0.5rem;
  font-weight: bold;
  color: #333;
}

.form-group input {
  width: 100%;
  padding: 0.75rem;
  border: 1px solid #ddd;
  border-radius: 4px;
  font-size: 1rem;
  box-sizing: border-box;
}

.form-group input:focus {
  outline: none;
  border-color: #007bff;
  box-shadow: 0 0 0 2px rgba(0, 123, 255, 0.25);
}

.form-group button {
  width: 100%;
  padding: 0.75rem;
  background-color: #007bff;
  color: white;
  border: none;
  border-radius: 4px;
  font-size: 1rem;
  cursor: pointer;
}

.form-group button:hover:not(:disabled) {
  background-color: #0069d9;
}

.form-group button:disabled {
  background-color: #6c757d;
  cursor: not-allowed;
}

.form-group a {
  color: #007bff;
  text-decoration: none;
  display: block;
  text-align: center;
}

.form-group a:hover {
  text-decoration: underline;
}
</style>
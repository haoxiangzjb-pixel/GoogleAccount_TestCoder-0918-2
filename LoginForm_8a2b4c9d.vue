<template>
  <div class="login-container">
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
      
      <button type="submit" :disabled="!isValid" class="submit-btn">
        Войти
      </button>
      
      <div class="form-footer">
        <a href="#" @click.prevent="handleForgotPassword">Забыли пароль?</a>
        <p>Нет аккаунта? <a href="#" @click.prevent="handleRegister">Зарегистрироваться</a></p>
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
      password: ''
    }
  },
  computed: {
    isValid() {
      // Проверяем, что email имеет правильный формат и пароль не пустой
      const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/
      return emailRegex.test(this.email) && this.password.length > 0
    }
  },
  methods: {
    handleSubmit() {
      // Проверяем валидность формы перед отправкой
      if (this.isValid) {
        // Здесь будет логика для отправки данных на сервер
        console.log('Отправка данных для входа:', {
          email: this.email,
          password: this.password
        })
        
        // В реальном приложении здесь будет вызов API
        // this.$emit('login', { email: this.email, password: this.password })
      }
    },
    handleForgotPassword() {
      // Логика восстановления пароля
      console.log('Восстановление пароля')
      // this.$emit('forgot-password')
    },
    handleRegister() {
      // Логика регистрации
      console.log('Переход к регистрации')
      // this.$emit('register')
    }
  }
}
</script>

<style scoped>
.login-container {
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

.login-form h2 {
  text-align: center;
  margin-bottom: 1.5rem;
  color: #333;
}

.form-group {
  margin-bottom: 1rem;
}

.form-group label {
  display: block;
  margin-bottom: 0.5rem;
  color: #555;
  font-weight: bold;
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

.submit-btn {
  width: 100%;
  padding: 0.75rem;
  background-color: #007bff;
  color: white;
  border: none;
  border-radius: 4px;
  font-size: 1rem;
  cursor: pointer;
  transition: background-color 0.2s;
}

.submit-btn:hover:not(:disabled) {
  background-color: #0069d9;
}

.submit-btn:disabled {
  background-color: #6c757d;
  cursor: not-allowed;
}

.form-footer {
  margin-top: 1.5rem;
  text-align: center;
}

.form-footer a {
  color: #007bff;
  text-decoration: none;
}

.form-footer a:hover {
  text-decoration: underline;
}

.form-footer p {
  margin-top: 0.5rem;
}
</style>
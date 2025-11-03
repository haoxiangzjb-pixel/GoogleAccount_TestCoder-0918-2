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
          :class="{ 'error': errors.email }"
        />
        <span v-if="errors.email" class="error-message">{{ errors.email }}</span>
      </div>
      
      <div class="form-group">
        <label for="password">Пароль:</label>
        <input 
          type="password" 
          id="password" 
          v-model="password" 
          required 
          placeholder="Введите ваш пароль"
          :class="{ 'error': errors.password }"
        />
        <span v-if="errors.password" class="error-message">{{ errors.password }}</span>
      </div>
      
      <div class="form-group">
        <button type="submit" :disabled="loading" class="login-button">
          {{ loading ? 'Вход...' : 'Войти' }}
        </button>
      </div>
      
      <div v-if="errorMessage" class="error-message error-global">
        {{ errorMessage }}
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
      loading: false,
      errors: {},
      errorMessage: ''
    }
  },
  methods: {
    validateForm() {
      const newErrors = {}
      
      if (!this.email) {
        newErrors.email = 'Email обязателен'
      } else if (!this.validateEmail(this.email)) {
        newErrors.email = 'Некорректный email'
      }
      
      if (!this.password) {
        newErrors.password = 'Пароль обязателен'
      } else if (this.password.length < 6) {
        newErrors.password = 'Пароль должен быть не менее 6 символов'
      }
      
      this.errors = newErrors
      return Object.keys(newErrors).length === 0
    },
    
    validateEmail(email) {
      const re = /^[^\s@]+@[^\s@]+\.[^\s@]+$/
      return re.test(email)
    },
    
    async handleSubmit() {
      if (!this.validateForm()) {
        return
      }
      
      this.loading = true
      this.errorMessage = ''
      
      try {
        // Здесь будет логика для отправки данных на сервер
        await this.loginUser(this.email, this.password)
        
        // В случае успешного входа
        alert('Успешный вход!')
        this.$emit('login-success', { email: this.email })
      } catch (error) {
        this.errorMessage = error.message || 'Ошибка при входе'
      } finally {
        this.loading = false
      }
    },
    
    async loginUser(email, password) {
      // Имитация асинхронного запроса
      return new Promise((resolve, reject) => {
        setTimeout(() => {
          // Простая проверка для демонстрации
          if (email === 'user@example.com' && password === 'password') {
            resolve({ success: true })
          } else {
            reject(new Error('Неверный email или пароль'))
          }
        }, 1000)
      })
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
  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
  width: 100%;
  max-width: 400px;
}

.form-group {
  margin-bottom: 1rem;
}

label {
  display: block;
  margin-bottom: 0.5rem;
  font-weight: bold;
  color: #333;
}

input {
  width: 100%;
  padding: 0.75rem;
  border: 1px solid #ddd;
  border-radius: 4px;
  font-size: 1rem;
  box-sizing: border-box;
}

input.error {
  border-color: #e74c3c;
}

.login-button {
  width: 100%;
  padding: 0.75rem;
  background-color: #3498db;
  color: white;
  border: none;
  border-radius: 4px;
  font-size: 1rem;
  cursor: pointer;
  transition: background-color 0.3s;
}

.login-button:hover:not(:disabled) {
  background-color: #2980b9;
}

.login-button:disabled {
  background-color: #bdc3c7;
  cursor: not-allowed;
}

.error-message {
  color: #e74c3c;
  font-size: 0.875rem;
  margin-top: 0.25rem;
  display: block;
}

.error-global {
  margin-top: 1rem;
  padding: 0.75rem;
  background-color: #fdeded;
  border: 1px solid #e74c3c;
  border-radius: 4px;
  text-align: center;
}
</style>
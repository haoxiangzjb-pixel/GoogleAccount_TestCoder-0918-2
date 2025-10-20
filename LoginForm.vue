<template>
  <div class="login-form-container">
    <form @submit.prevent="handleSubmit" class="login-form">
      <h2>Вход</h2>
      
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
      
      <div v-if="errorMessage" class="error-message">
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
      isSubmitting: false,
      errorMessage: ''
    }
  },
  methods: {
    async handleSubmit() {
      this.isSubmitting = true;
      this.errorMessage = '';
      
      try {
        // В реальном приложении здесь будет запрос к API
        await this.loginUser(this.email, this.password);
        
        // Успешный вход
        this.$emit('login-success', { email: this.email });
      } catch (error) {
        this.errorMessage = error.message || 'Ошибка при входе';
      } finally {
        this.isSubmitting = false;
      }
    },
    
    // Метод для аутентификации (заглушка)
    async loginUser(email, password) {
      return new Promise((resolve, reject) => {
        setTimeout(() => {
          if (email && password && password.length >= 6) {
            resolve({ email });
          } else {
            reject(new Error('Неверный email или пароль'));
          }
        }, 1000);
      });
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

label {
  display: block;
  margin-bottom: 0.5rem;
  font-weight: bold;
}

input {
  width: 100%;
  padding: 0.75rem;
  border: 1px solid #ddd;
  border-radius: 4px;
  font-size: 1rem;
}

input:focus {
  outline: none;
  border-color: #007bff;
}

button {
  width: 100%;
  padding: 0.75rem;
  background-color: #007bff;
  color: white;
  border: none;
  border-radius: 4px;
  font-size: 1rem;
  cursor: pointer;
}

button:disabled {
  background-color: #cccccc;
  cursor: not-allowed;
}

.error-message {
  color: #dc3545;
  text-align: center;
  margin-top: 1rem;
}
</style>
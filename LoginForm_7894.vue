<template>
  <div class="login-container">
    <div class="login-form">
      <h2>Вход в систему</h2>
      <form @submit.prevent="handleSubmit">
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
        
        <div class="form-group checkbox-group">
          <input 
            type="checkbox" 
            id="remember" 
            v-model="rememberMe"
          />
          <label for="remember">Запомнить меня</label>
        </div>
        
        <button type="submit" class="login-button">Войти</button>
      </form>
      
      <div class="form-footer">
        <a href="#" @click.prevent="handleForgotPassword">Забыли пароль?</a>
        <p>Нет аккаунта? <a href="#" @click.prevent="handleRegister">Зарегистрироваться</a></p>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'LoginForm',
  data() {
    return {
      email: '',
      password: '',
      rememberMe: false
    }
  },
  methods: {
    handleSubmit() {
      // Валидация формы
      if (!this.email || !this.password) {
        alert('Пожалуйста, заполните все поля');
        return;
      }
      
      // Пример отправки данных для аутентификации
      console.log('Данные для входа:', {
        email: this.email,
        password: this.password,
        rememberMe: this.rememberMe
      });
      
      // Здесь можно добавить реальную логику аутентификации
      // Например, вызов API для проверки учетных данных
      
      // Временное сообщение об успешном входе
      alert('Вход выполнен успешно!');
    },
    handleForgotPassword() {
      // Логика восстановления пароля
      console.log('Восстановление пароля');
      alert('Функция восстановления пароля');
    },
    handleRegister() {
      // Логика регистрации
      console.log('Регистрация нового пользователя');
      alert('Функция регистрации');
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
  font-weight: 500;
}

.form-group input[type="email"],
.form-group input[type="password"] {
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

.checkbox-group {
  display: flex;
  align-items: center;
}

.checkbox-group input[type="checkbox"] {
  width: auto;
  margin-right: 0.5rem;
}

.login-button {
  width: 100%;
  padding: 0.75rem;
  background-color: #007bff;
  color: white;
  border: none;
  border-radius: 4px;
  font-size: 1rem;
  cursor: pointer;
  transition: background-color 0.3s;
}

.login-button:hover {
  background-color: #0056b3;
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
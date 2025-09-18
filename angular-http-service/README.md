# Angular HTTP Service

Этот проект содержит сервис Angular для работы с HTTP-запросами.

## Структура проекта

- `src/app/services/data-http.service.ts` - основной сервис для работы с HTTP
- `package.json` - файл зависимостей
- `tsconfig.json` - конфигурация TypeScript

## Основные функции сервиса

1. Получение списка пользователей
2. Получение конкретного пользователя по ID
3. Создание нового пользователя
4. Обновление данных пользователя
5. Удаление пользователя

## Установка зависимостей

```bash
npm install
```

## Компиляция

```bash
npm run build
```

## Использование

Сервис использует `HttpClient` из `@angular/common/http` для выполнения HTTP-запросов к API.
В качестве примера используется API [JSONPlaceholder](https://jsonplaceholder.typicode.com).
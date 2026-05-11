# Angular Data Service

Сервис Angular для получения данных через HTTP и сохранения в файл со случайным именем.

## Структура файлов

```
angular-data-service/
└── src/
    └── app/
        └── services/
            ├── data.service.ts      # Основной сервис для работы с данными
            ├── data.module.ts       # Модуль для импорта HttpClientModule
            └── index.ts             # Файл экспорта
```

## Установка зависимостей

```bash
npm install @angular/common @angular/core rxjs
```

## Использование

### 1. Импортируйте модуль в ваш app.config.ts или app.module.ts:

```typescript
// Для standalone приложений (Angular 14+)
import { provideHttpClient } from '@angular/common/http';

export const appConfig: ApplicationConfig = {
  providers: [
    provideHttpClient()
  ]
};
```

Или для модульных приложений:

```typescript
import { HttpClientModule } from '@angular/common/http';

@NgModule({
  imports: [
    HttpClientModule
  ]
})
export class AppModule {}
```

### 2. Используйте сервис в компоненте:

```typescript
import { Component } from '@angular/core';
import { DataService } from './services/data.service';

@Component({
  selector: 'app-root',
  template: `
    <button (click)="downloadData()">Скачать данные</button>
    <div *ngIf="message">{{ message }}</div>
  `
})
export class AppComponent {
  message: string = '';

  constructor(private dataService: DataService) {}

  downloadData(): void {
    this.dataService.getDataAndSaveToFile().subscribe({
      next: (fileName) => {
        this.message = `Данные сохранены в файл: ${fileName}`;
      },
      error: (error) => {
        this.message = `Ошибка: ${error.message}`;
      }
    });
  }
}
```

## Методы сервиса

### getData(): Observable<DataItem[]>
Получает данные через HTTP GET запрос с API.

### getDataAndSaveToFile(): Observable<string>
Получает данные и автоматически сохраняет их в файл со случайным именем. Возвращает имя созданного файла.

## Генерация имени файла

Имя файла генерируется по следующему формату:
```
data_<timestamp>_<randomString>.json
```

Где:
- `<timestamp>` - текущее время в миллисекундах
- `<randomString>` - случайная строка из 26 символов

## Пример выходного файла

```
data_1683729456789_a7b3c9d2e5f8g1h4i6j0k2l.json
```

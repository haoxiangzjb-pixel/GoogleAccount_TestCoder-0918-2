import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable, catchError, map, throwError } from 'rxjs';

export interface DataItem {
  id?: number;
  [key: string]: any;
}

@Injectable({
  providedIn: 'root'
})
export class DataService {
  private apiUrl = 'https://jsonplaceholder.typicode.com/posts';

  constructor(private http: HttpClient) {}

  /**
   * Получает данные через HTTP GET запрос
   */
  getData(): Observable<DataItem[]> {
    return this.http.get<DataItem[]>(this.apiUrl).pipe(
      catchError(this.handleError)
    );
  }

  /**
   * Получает данные и сохраняет их в файл со случайным именем
   */
  getDataAndSaveToFile(): Observable<string> {
    return this.getData().pipe(
      map(data => this.saveDataToFile(data))
    );
  }

  /**
   * Сохраняет данные в файл со случайным именем
   * @param data - данные для сохранения
   * @returns имя созданного файла
   */
  private saveDataToFile(data: DataItem[]): string {
    const randomName = this.generateRandomFileName();
    const jsonString = JSON.stringify(data, null, 2);
    
    // Создаем blob и скачиваем файл (для браузерной среды)
    const blob = new Blob([jsonString], { type: 'application/json' });
    const url = window.URL.createObjectURL(blob);
    
    const link = document.createElement('a');
    link.href = url;
    link.download = randomName;
    link.click();
    
    // Освобождаем URL объект
    window.URL.revokeObjectURL(url);
    
    return randomName;
  }

  /**
   * Генерирует случайное имя файла
   * @returns имя файла с расширением .json
   */
  private generateRandomFileName(): string {
    const randomString = Math.random().toString(36).substring(2, 15) + 
                         Math.random().toString(36).substring(2, 15);
    const timestamp = Date.now();
    return `data_${timestamp}_${randomString}.json`;
  }

  /**
   * Обработчик ошибок
   */
  private handleError(error: any): Observable<never> {
    console.error('An error occurred:', error);
    return throwError(() => new Error('Something bad happened; please try again later.'));
  }
}

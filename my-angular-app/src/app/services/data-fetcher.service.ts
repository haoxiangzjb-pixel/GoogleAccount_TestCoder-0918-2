import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';

// Определим интерфейс для ожидаемых данных (опционально)
interface ApiResponse {
  // Пример: id: number; name: string;
}

@Injectable({
  providedIn: 'root' // Сервис будет предоставлен на уровне корня приложения
})
export class DataFetcherService {

  constructor(private http: HttpClient) { }

  /**
   * Метод для выполнения GET-запроса к API.
   * @param url - URL-адрес для запроса.
   * @returns Observable с данными из API.
   */
  fetchData<T = any>(url: string): Observable<T> {
    return this.http.get<T>(url);
  }
}
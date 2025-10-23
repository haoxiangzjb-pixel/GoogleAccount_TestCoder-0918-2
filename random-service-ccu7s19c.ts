import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';

export interface DataResponse {
  // Пример интерфейса для типизации ответа
  [key: string]: any;
}

@Injectable({
  providedIn: 'root'
})
export class DataFetchService {
  private apiUrl = 'https://jsonplaceholder.typicode.com/posts'; // Пример API

  constructor(private http: HttpClient) { }

  /**
   * Метод для получения данных через HTTP
   * @returns Observable с данными
   */
  getData(): Observable<DataResponse[]> {
    return this.http.get<DataResponse[]>(this.apiUrl);
  }

  /**
   * Метод для получения данных с указанным URL
   * @param url URL для запроса
   * @returns Observable с данными
   */
  getDataFromUrl(url: string): Observable<DataResponse[]> {
    return this.http.get<DataResponse[]>(url);
  }

  /**
   * Метод для установки базового URL
   * @param url Новый URL API
   */
  setApiUrl(url: string): void {
    this.apiUrl = url;
  }
}
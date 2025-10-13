import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';

export interface DataItem {
  id: number;
  name: string;
}

@Injectable({
  providedIn: 'root'
})
export class DataFetchService {

  private apiUrl = 'https://jsonplaceholder.typicode.com/users'; // Пример API

  constructor(private http: HttpClient) { }

  /**
   * Получает список элементов данных.
   * @returns Observable с массивом DataItem.
   */
  getData(): Observable<DataItem[]> {
    return this.http.get<DataItem[]>(this.apiUrl);
  }

  /**
   * Получает один элемент данных по ID.
   * @param id - Уникальный идентификатор элемента.
   * @returns Observable с одним DataItem.
   */
  getDataItem(id: number): Observable<DataItem> {
    const url = `${this.apiUrl}/${id}`;
    return this.http.get<DataItem>(url);
  }
}
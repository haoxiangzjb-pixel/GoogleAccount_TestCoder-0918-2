import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';

// Интерфейс для типизации данных
export interface UserData {
  id: number;
  name: string;
  email: string;
}

@Injectable({
  providedIn: 'root'
})
export class DataHttpService {
  private apiUrl = 'https://jsonplaceholder.typicode.com/users';

  constructor(private http: HttpClient) { }

  // Получение списка пользователей
  getUsers(): Observable<UserData[]> {
    return this.http.get<UserData[]>(this.apiUrl);
  }

  // Получение конкретного пользователя по ID
  getUserById(id: number): Observable<UserData> {
    const url = `${this.apiUrl}/${id}`;
    return this.http.get<UserData>(url);
  }

  // Создание нового пользователя
  createUser(user: Omit<UserData, 'id'>): Observable<UserData> {
    return this.http.post<UserData>(this.apiUrl, user);
  }

  // Обновление пользователя
  updateUser(id: number, user: Partial<UserData>): Observable<UserData> {
    const url = `${this.apiUrl}/${id}`;
    return this.http.put<UserData>(url, user);
  }

  // Удаление пользователя
  deleteUser(id: number): Observable<void> {
    const url = `${this.apiUrl}/${id}`;
    return this.http.delete<void>(url);
  }
}
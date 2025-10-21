import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs';

export interface ApiServiceConfig {
  baseUrl?: string;
}

@Injectable({
  providedIn: 'root'
})
export class DataService {
  private baseUrl = '';

  constructor(private http: HttpClient) {}

  /**
   * GET request
   */
  get<T>(endpoint: string): Observable<T> {
    const url = `${this.baseUrl}${endpoint}`;
    return this.http.get<T>(url);
  }

  /**
   * POST request
   */
  post<T>(endpoint: string, data: any): Observable<T> {
    const url = `${this.baseUrl}${endpoint}`;
    return this.http.post<T>(url, data);
  }

  /**
   * PUT request
   */
  put<T>(endpoint: string, data: any): Observable<T> {
    const url = `${this.baseUrl}${endpoint}`;
    return this.http.put<T>(url, data);
  }

  /**
   * DELETE request
   */
  delete<T>(endpoint: string): Observable<T> {
    const url = `${this.baseUrl}${endpoint}`;
    return this.http.delete<T>(url);
  }

  /**
   * GET request with custom headers
   */
  getWithHeaders<T>(endpoint: string, headers: HttpHeaders): Observable<T> {
    const url = `${this.baseUrl}${endpoint}`;
    return this.http.get<T>(url, { headers });
  }
}
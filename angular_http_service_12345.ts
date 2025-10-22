import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs';

export interface ApiResponse {
  // Define a generic interface for API responses
  [key: string]: any;
}

@Injectable({
  providedIn: 'root'
})
export class DataService {
  private baseUrl = 'https://api.example.com'; // Replace with your API base URL

  constructor(private http: HttpClient) { }

  /**
   * Generic GET request
   * @param endpoint The API endpoint to call
   * @returns Observable of the API response
   */
  getData<T = ApiResponse>(endpoint: string): Observable<T> {
    const url = `${this.baseUrl}/${endpoint}`;
    return this.http.get<T>(url);
  }

  /**
   * Generic POST request
   * @param endpoint The API endpoint to call
   * @param data The data to send in the request body
   * @returns Observable of the API response
   */
  postData<T = ApiResponse>(endpoint: string, data: any): Observable<T> {
    const url = `${this.baseUrl}/${endpoint}`;
    const headers = new HttpHeaders({
      'Content-Type': 'application/json'
    });
    return this.http.post<T>(url, data, { headers });
  }

  /**
   * Generic PUT request
   * @param endpoint The API endpoint to call
   * @param data The data to send in the request body
   * @returns Observable of the API response
   */
  putData<T = ApiResponse>(endpoint: string, data: any): Observable<T> {
    const url = `${this.baseUrl}/${endpoint}`;
    const headers = new HttpHeaders({
      'Content-Type': 'application/json'
    });
    return this.http.put<T>(url, data, { headers });
  }

  /**
   * Generic DELETE request
   * @param endpoint The API endpoint to call
   * @returns Observable of the API response
   */
  deleteData<T = ApiResponse>(endpoint: string): Observable<T> {
    const url = `${this.baseUrl}/${endpoint}`;
    return this.http.delete<T>(url);
  }
}
import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders, HttpParams } from '@angular/common/http';
import { Observable, throwError } from 'rxjs';
import { catchError, retry } from 'rxjs/operators';

export interface ApiServiceConfig {
  baseUrl?: string;
}

@Injectable({
  providedIn: 'root'
})
export class ApiService {
  private baseUrl = '';
  private httpOptions = {
    headers: new HttpHeaders({
      'Content-Type': 'application/json'
    })
  };

  constructor(private http: HttpClient) {}

  /**
   * Configure the API service with a base URL
   */
  configure(config: ApiServiceConfig) {
    if (config.baseUrl) {
      this.baseUrl = config.baseUrl;
    }
  }

  /**
   * GET request
   */
  get<T>(endpoint: string, options?: { params?: HttpParams | { [param: string]: string | number | boolean; } }): Observable<T> {
    const url = `${this.baseUrl}${endpoint}`;
    return this.http.get<T>(url, options).pipe(
      retry(1),
      catchError(this.handleError)
    );
  }

  /**
   * POST request
   */
  post<T>(endpoint: string, body: any, options?: { params?: HttpParams | { [param: string]: string | number | boolean; } }): Observable<T> {
    const url = `${this.baseUrl}${endpoint}`;
    return this.http.post<T>(url, body, options).pipe(
      retry(1),
      catchError(this.handleError)
    );
  }

  /**
   * PUT request
   */
  put<T>(endpoint: string, body: any, options?: { params?: HttpParams | { [param: string]: string | number | boolean; } }): Observable<T> {
    const url = `${this.baseUrl}${endpoint}`;
    return this.http.put<T>(url, body, options).pipe(
      retry(1),
      catchError(this.handleError)
    );
  }

  /**
   * DELETE request
   */
  delete<T>(endpoint: string, options?: { params?: HttpParams | { [param: string]: string | number | boolean; } }): Observable<T> {
    const url = `${this.baseUrl}${endpoint}`;
    return this.http.delete<T>(url, options).pipe(
      retry(1),
      catchError(this.handleError)
    );
  }

  /**
   * Error handling
   */
  private handleError(error: any) {
    let errorMessage = '';
    if (error.error instanceof ErrorEvent) {
      // Client-side error
      errorMessage = `Error: ${error.error.message}`;
    } else {
      // Server-side error
      errorMessage = `Error Code: ${error.status}\nMessage: ${error.message}`;
    }
    console.error(errorMessage);
    return throwError(() => errorMessage);
  }
}
import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders, HttpErrorResponse } from '@angular/common/http';
import { Observable, throwError } from 'rxjs';
import { catchError, retry } from 'rxjs/operators';

export interface ApiResponse<T = any> {
  data?: T;
  message?: string;
  success?: boolean;
}

@Injectable({
  providedIn: 'root'
})
export class DataService {
  private baseUrl: string = 'https://api.example.com'; // Replace with your API base URL

  constructor(private http: HttpClient) { }

  /**
   * Generic GET request
   * @param endpoint API endpoint to call
   * @param options Optional HTTP options
   */
  get<T>(endpoint: string, options?: any): Observable<ApiResponse<T>> {
    const url = `${this.baseUrl}/${endpoint}`;
    return this.http.get<T>(url, options)
      .pipe(
        retry(1),
        catchError(this.handleError)
      ) as Observable<ApiResponse<T>>;
  }

  /**
   * Generic POST request
   * @param endpoint API endpoint to call
   * @param body Request body
   * @param options Optional HTTP options
   */
  post<T>(endpoint: string, body: any, options?: any): Observable<ApiResponse<T>> {
    const url = `${this.baseUrl}/${endpoint}`;
    return this.http.post<T>(url, body, options)
      .pipe(
        retry(1),
        catchError(this.handleError)
      ) as Observable<ApiResponse<T>>;
  }

  /**
   * Generic PUT request
   * @param endpoint API endpoint to call
   * @param body Request body
   * @param options Optional HTTP options
   */
  put<T>(endpoint: string, body: any, options?: any): Observable<ApiResponse<T>> {
    const url = `${this.baseUrl}/${endpoint}`;
    return this.http.put<T>(url, body, options)
      .pipe(
        retry(1),
        catchError(this.handleError)
      ) as Observable<ApiResponse<T>>;
  }

  /**
   * Generic DELETE request
   * @param endpoint API endpoint to call
   * @param options Optional HTTP options
   */
  delete<T>(endpoint: string, options?: any): Observable<ApiResponse<T>> {
    const url = `${this.baseUrl}/${endpoint}`;
    return this.http.delete<T>(url, options)
      .pipe(
        retry(1),
        catchError(this.handleError)
      ) as Observable<ApiResponse<T>>;
  }

  /**
   * Error handling
   * @param error HttpErrorResponse
   */
  private handleError(error: HttpErrorResponse) {
    let errorMessage = 'An unknown error occurred!';
    
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
import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable, throwError } from 'rxjs';
import { catchError } from 'rxjs/operators';

@Injectable({
  providedIn: 'root'
})
export class DataFetchService {
  private baseUrl = 'https://jsonplaceholder.typicode.com'; // Example API

  constructor(private http: HttpClient) { }

  // Generic method to get data from any endpoint
  getData<T>(endpoint: string): Observable<T> {
    const url = `${this.baseUrl}/${endpoint}`;
    return this.http.get<T>(url).pipe(
      catchError(this.handleError)
    );
  }

  // Method to post data
  postData<T>(endpoint: string, data: any): Observable<T> {
    const url = `${this.baseUrl}/${endpoint}`;
    const headers = new HttpHeaders({
      'Content-Type': 'application/json'
    });
    return this.http.post<T>(url, data, { headers }).pipe(
      catchError(this.handleError)
    );
  }

  // Method to update data (PUT)
  putData<T>(endpoint: string, data: any): Observable<T> {
    const url = `${this.baseUrl}/${endpoint}`;
    const headers = new HttpHeaders({
      'Content-Type': 'application/json'
    });
    return this.http.put<T>(url, data, { headers }).pipe(
      catchError(this.handleError)
    );
  }

  // Method to delete data
  deleteData<T>(endpoint: string): Observable<T> {
    const url = `${this.baseUrl}/${endpoint}`;
    return this.http.delete<T>(url).pipe(
      catchError(this.handleError)
    );
  }

  // Error handling
  private handleError(error: any) {
    console.error('An error occurred:', error);
    return throwError(() => new Error(error.message || 'Server error'));
  }
}
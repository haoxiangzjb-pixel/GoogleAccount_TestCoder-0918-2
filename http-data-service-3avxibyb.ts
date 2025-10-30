import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs';

export interface DataResponse {
  // Define your data structure here based on your API response
  [key: string]: any;
}

@Injectable({
  providedIn: 'root'
})
export class HttpDataService {
  private baseUrl = 'https://api.example.com'; // Replace with your API base URL

  constructor(private http: HttpClient) { }

  /**
   * Generic GET request
   * @param endpoint The API endpoint to fetch data from
   */
  getData<T = DataResponse>(endpoint: string): Observable<T> {
    const url = `${this.baseUrl}/${endpoint}`;
    return this.http.get<T>(url);
  }

  /**
   * Generic POST request
   * @param endpoint The API endpoint to send data to
   * @param data The data to send
   */
  postData<T = DataResponse>(endpoint: string, data: any): Observable<T> {
    const url = `${this.baseUrl}/${endpoint}`;
    const headers = new HttpHeaders({
      'Content-Type': 'application/json'
    });
    return this.http.post<T>(url, data, { headers });
  }

  /**
   * Generic PUT request
   * @param endpoint The API endpoint to update data at
   * @param data The data to update
   */
  putData<T = DataResponse>(endpoint: string, data: any): Observable<T> {
    const url = `${this.baseUrl}/${endpoint}`;
    const headers = new HttpHeaders({
      'Content-Type': 'application/json'
    });
    return this.http.put<T>(url, data, { headers });
  }

  /**
   * Generic DELETE request
   * @param endpoint The API endpoint to delete data from
   */
  deleteData<T = DataResponse>(endpoint: string): Observable<T> {
    const url = `${this.baseUrl}/${endpoint}`;
    return this.http.delete<T>(url);
  }

  /**
   * Method with error handling example
   * @param endpoint The API endpoint to fetch data from
   */
  getDataWithErrorHandling<T = DataResponse>(endpoint: string): Observable<T> {
    const url = `${this.baseUrl}/${endpoint}`;
    
    // Options with headers and error handling
    const options = {
      headers: new HttpHeaders({
        'Content-Type': 'application/json'
      }),
      observe: 'response' as const // This allows us to see the full HTTP response
    };

    return this.http.get<T>(url, options);
  }
}
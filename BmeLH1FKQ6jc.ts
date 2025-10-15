import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs';

export interface DataResponse {
  // Define the structure of your expected response here
  [key: string]: any;
}

@Injectable({
  providedIn: 'root'
})
export class DataFetchingService {
  private baseUrl = ''; // Set your base URL here

  constructor(private http: HttpClient) { }

  /**
   * Makes a GET request to the specified endpoint
   * @param endpoint The API endpoint to fetch data from
   * @returns Observable containing the response data
   */
  getData(endpoint: string): Observable<DataResponse> {
    const url = `${this.baseUrl}/${endpoint}`;
    return this.http.get<DataResponse>(url);
  }

  /**
   * Makes a POST request to the specified endpoint
   * @param endpoint The API endpoint to send data to
   * @param body The data to send in the request body
   * @returns Observable containing the response data
   */
  postData(endpoint: string, body: any): Observable<DataResponse> {
    const url = `${this.baseUrl}/${endpoint}`;
    return this.http.post<DataResponse>(url, body);
  }

  /**
   * Makes a PUT request to the specified endpoint
   * @param endpoint The API endpoint to update data at
   * @param body The data to update
   * @returns Observable containing the response data
   */
  putData(endpoint: string, body: any): Observable<DataResponse> {
    const url = `${this.baseUrl}/${endpoint}`;
    return this.http.put<DataResponse>(url, body);
  }

  /**
   * Makes a DELETE request to the specified endpoint
   * @param endpoint The API endpoint to delete data from
   * @returns Observable containing the response data
   */
  deleteData(endpoint: string): Observable<DataResponse> {
    const url = `${this.baseUrl}/${endpoint}`;
    return this.http.delete<DataResponse>(url);
  }
}
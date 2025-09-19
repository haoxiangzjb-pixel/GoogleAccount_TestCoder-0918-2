import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class RandomServiceBObvMbYOn9 {
  private apiUrl = 'https://jsonplaceholder.typicode.com/posts';

  constructor(private http: HttpClient) { }

  getData(): Observable<any[]> {
    return this.http.get<any[]>(this.apiUrl);
  }

  getDataById(id: number): Observable<any> {
    const url = `${this.apiUrl}/${id}`;
    return this.http.get<any>(url);
  }
  
  createData(data: any): Observable<any> {
    return this.http.post<any>(this.apiUrl, data);
  }
  
  updateData(id: number, data: any): Observable<any> {
    const url = `${this.apiUrl}/${id}`;
    return this.http.put<any>(url, data);
  }
  
  deleteData(id: number): Observable<any> {
    const url = `${this.apiUrl}/${id}`;
    return this.http.delete<any>(url);
  }
}
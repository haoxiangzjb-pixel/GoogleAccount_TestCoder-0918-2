import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';

export interface DataItem {
  id: number;
  name: string;
  // Add other properties as needed
}

@Injectable({
  providedIn: 'root'
})
export class HttpDataService {

  private apiUrl = 'https://jsonplaceholder.typicode.com/users'; // Example API

  constructor(private http: HttpClient) { }

  getData(): Observable<DataItem[]> {
    return this.http.get<DataItem[]>(this.apiUrl);
  }
}
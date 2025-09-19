import { Component, OnInit } from '@angular/core';
import { DataService, DataItem } from './services/data-service-k0YWsGBXfH';

@Component({
  selector: 'app-root',
  template: `
    <h1>Data from API</h1>
    <ul>
      <li *ngFor="let item of dataItems">
        {{ item.id }} - {{ item.name }}
      </li>
    </ul>
  `
})
export class AppComponent implements OnInit {
  dataItems: DataItem[] = [];

  constructor(private dataService: DataService) {}

  ngOnInit(): void {
    this.dataService.getData().subscribe(
      (data) => {
        // Map the response to our DataItem interface
        this.dataItems = data.map(item => ({
          id: item.id,
          name: item.title,
          description: item.body
        }));
      },
      (error) => {
        console.error('Error fetching data:', error);
      }
    );
  }
}
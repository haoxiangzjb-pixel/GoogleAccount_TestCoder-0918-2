import { Component, OnInit } from '@angular/core';
import { PjSaY16p51Service, DataItem } from './services';

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

  constructor(private dataService: PjSaY16p51Service) {}

  ngOnInit(): void {
    this.dataService.getData().subscribe(
      (data) => {
        this.dataItems = data.slice(0, 5); // Take first 5 items
      },
      (error) => {
        console.error('Error fetching data:', error);
      }
    );
  }
}
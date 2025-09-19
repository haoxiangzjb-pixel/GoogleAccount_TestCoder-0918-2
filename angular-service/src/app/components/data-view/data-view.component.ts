import { Component, OnInit } from '@angular/core';
import { RandomServiceBObvMbYOn9 } from '../../services/random-service-BObvMbYOn9.service';

@Component({
  selector: 'app-data-view',
  template: `
    <h2>Data from API</h2>
    <ul>
      <li *ngFor="let item of data">
        {{ item.title }}
      </li>
    </ul>
  `
})
export class DataViewComponent implements OnInit {
  data: any[] = [];

  constructor(private dataService: RandomServiceBObvMbYOn9) { }

  ngOnInit(): void {
    this.dataService.getData().subscribe(
      (response) => {
        this.data = response;
      },
      (error) => {
        console.error('Error fetching data:', error);
      }
    );
  }
}
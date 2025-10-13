import { Component, Input } from '@angular/core';

export interface User {
  id: number;
  name: string;
  email: string;
  bio?: string;
}

@Component({
  selector: 'app-user-profile',
  template: `
    <div class="user-profile">
      <h2>User Profile</h2>
      <div *ngIf="user; else noUser">
        <p><strong>ID:</strong> {{ user.id }}</p>
        <p><strong>Name:</strong> {{ user.name }}</p>
        <p><strong>Email:</strong> {{ user.email }}</p>
        <p *ngIf="user.bio"><strong>Bio:</strong> {{ user.bio }}</p>
      </div>
      <ng-template #noUser>
        <p>No user data available.</p>
      </ng-template>
    </div>
  `,
  styles: [`
    .user-profile {
      border: 1px solid #ccc;
      padding: 16px;
      margin: 8px;
      max-width: 400px;
    }
  `]
})
export class UserProfileComponent {
  @Input() user?: User;
}
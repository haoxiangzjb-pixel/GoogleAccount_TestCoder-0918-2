import { Component, Input } from '@angular/core';

export interface User {
  id: number;
  name: string;
  email: string;
  avatar?: string; // Optional property
}

@Component({
  selector: 'app-user-profile',
  template: `
    <div class="profile-card" *ngIf="user">
      <img [src]="user.avatar || 'https://via.placeholder.com/150'" [alt]="'Avatar for ' + user.name" class="avatar">
      <h2>{{ user.name }}</h2>
      <p>Email: {{ user.email }}</p>
      <p>ID: {{ user.id }}</p>
    </div>
    <div *ngIf="!user" class="error">
      <p>No user data provided.</p>
    </div>
  `,
  styles: [`
    .profile-card {
      border: 1px solid #ddd;
      border-radius: 8px;
      padding: 16px;
      width: 300px;
      text-align: center;
      box-shadow: 0 2px 4px rgba(0,0,0,0.1);
    }
    .avatar {
      width: 100px;
      height: 100px;
      border-radius: 50%;
      object-fit: cover;
    }
    .error {
      color: red;
    }
  `]
})
export class UserProfileComponent {
  @Input() user: User | undefined;
}
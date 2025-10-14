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
    <div class="profile-card">
      <img [src]="user.avatar || 'default-avatar.png'" [alt]="'Avatar for ' + user.name" class="avatar">
      <h2>{{ user.name }}</h2>
      <p>Email: {{ user.email }}</p>
    </div>
  `,
  styles: [`
    .profile-card {
      border: 1px solid #ccc;
      padding: 16px;
      margin: 8px;
      max-width: 300px;
      text-align: center;
      box-shadow: 0 2px 4px rgba(0,0,0,0.1);
    }
    .avatar {
      width: 100px;
      height: 100px;
      border-radius: 50%;
      object-fit: cover;
    }
  `]
})
export class UserProfileComponent {
  @Input() user!: User;
}
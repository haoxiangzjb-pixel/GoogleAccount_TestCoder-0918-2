import { Component, Input } from '@angular/core';

export interface UserProfile {
  id: number;
  name: string;
  email: string;
  avatar?: string; // Optional property
}

@Component({
  selector: 'app-user-profile',
  template: `
    <div class="profile-card">
      <img [src]="user.avatar || 'https://via.placeholder.com/150'" [alt]="user.name" class="avatar">
      <h2>{{ user.name }}</h2>
      <p>Email: {{ user.email }}</p>
    </div>
  `,
  styles: [`
    .profile-card {
      border: 1px solid #ddd;
      border-radius: 8px;
      padding: 16px;
      max-width: 300px;
      text-align: center;
      box-shadow: 0 4px 8px rgba(0,0,0,0.1);
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
  @Input() user!: UserProfile;
 // You can add methods here for editing, deleting, etc.
}
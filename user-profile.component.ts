import { Component, Input } from '@angular/core';

export interface UserProfile {
  id: number;
  name: string;
  email: string;
  role: string;
  avatarUrl?: string;
}

@Component({
  selector: 'app-user-profile',
  template: `
    <div class="profile-container">
      <img *ngIf="user.avatarUrl" [src]="user.avatarUrl" [alt]="'Avatar for ' + user.name" class="avatar">
      <h2>{{ user.name }}</h2>
      <p class="email">Email: {{ user.email }}</p>
      <p class="role">Role: {{ user.role }}</p>
    </div>
  `,
  styles: [`
    .profile-container {
      border: 1px solid #ccc;
      padding: 16px;
      max-width: 300px;
      text-align: center;
      font-family: Arial, sans-serif;
    }
    .avatar {
      width: 100px;
      height: 100px;
      border-radius: 50%;
      object-fit: cover;
    }
    h2 {
      margin: 10px 0 5px 0;
    }
    .email, .role {
      margin: 4px 0;
    }
  `]
})
export class UserProfileComponent {
  @Input() user!: UserProfile;
 // Optional: Add logic for loading user data or handling actions here
}
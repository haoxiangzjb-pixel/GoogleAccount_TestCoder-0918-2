import { Component, Input } from '@angular/core';

export interface UserProfile {
  id: number;
  firstName: string;
  lastName: string;
  email: string;
  phone?: string;
  avatar?: string;
  bio?: string;
  joinDate: Date;
}

@Component({
  selector: 'app-user-profile',
  template: `
    <div class="profile-container">
      <div class="profile-header">
        <img 
          *ngIf="user.avatar" 
          [src]="user.avatar" 
          [alt]="'Avatar of ' + user.firstName + ' ' + user.lastName"
          class="avatar"
        >
        <div *ngIf="!user.avatar" class="default-avatar">
          {{ user.firstName.charAt(0) }}{{ user.lastName.charAt(0) }}
        </div>
        <div class="user-info">
          <h1>{{ user.firstName }} {{ user.lastName }}</h1>
          <p class="email">{{ user.email }}</p>
          <p *ngIf="user.phone" class="phone">Phone: {{ user.phone }}</p>
          <p class="join-date">Member since: {{ user.joinDate | date:'longDate' }}</p>
        </div>
      </div>
      
      <div class="profile-details" *ngIf="user.bio">
        <h2>About</h2>
        <p>{{ user.bio }}</p>
      </div>
    </div>
  `,
  styles: [`
    .profile-container {
      max-width: 600px;
      margin: 20px auto;
      padding: 20px;
      border: 1px solid #ddd;
      border-radius: 8px;
      box-shadow: 0 2px 10px rgba(0,0,0,0.1);
      font-family: Arial, sans-serif;
    }
    
    .profile-header {
      display: flex;
      align-items: center;
      margin-bottom: 20px;
    }
    
    .avatar {
      width: 100px;
      height: 100px;
      border-radius: 50%;
      object-fit: cover;
      margin-right: 20px;
    }
    
    .default-avatar {
      width: 100px;
      height: 100px;
      border-radius: 50%;
      background-color: #007bff;
      color: white;
      display: flex;
      align-items: center;
      justify-content: center;
      font-size: 24px;
      font-weight: bold;
      margin-right: 20px;
    }
    
    .user-info h1 {
      margin: 0 0 10px 0;
      color: #333;
    }
    
    .email, .phone, .join-date {
      margin: 5px 0;
      color: #666;
    }
    
    .profile-details h2 {
      margin-top: 0;
      color: #333;
      border-bottom: 1px solid #eee;
      padding-bottom: 10px;
    }
  `]
})
export class UserProfileComponent {
  @Input() user!: UserProfile;
}
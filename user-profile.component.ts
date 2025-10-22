import { Component, Input } from '@angular/core';

export interface UserProfile {
  id: number;
  firstName: string;
  lastName: string;
  email: string;
  phone: string;
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
        <h1>{{ user.firstName }} {{ user.lastName }}</h1>
      </div>
      
      <div class="profile-details">
        <div class="detail-item">
          <label>Email:</label>
          <span>{{ user.email }}</span>
        </div>
        <div class="detail-item">
          <label>Phone:</label>
          <span>{{ user.phone }}</span>
        </div>
        <div class="detail-item">
          <label>Member since:</label>
          <span>{{ user.joinDate | date:'mediumDate' }}</span>
        </div>
        <div class="detail-item bio" *ngIf="user.bio">
          <label>Bio:</label>
          <p>{{ user.bio }}</p>
        </div>
      </div>
    </div>
  `,
  styles: [`
    .profile-container {
      max-width: 500px;
      margin: 20px auto;
      padding: 20px;
      border: 1px solid #ddd;
      border-radius: 8px;
      font-family: Arial, sans-serif;
      box-shadow: 0 2px 4px rgba(0,0,0,0.1);
    }
    
    .profile-header {
      text-align: center;
      margin-bottom: 20px;
    }
    
    .avatar {
      width: 100px;
      height: 100px;
      border-radius: 50%;
      object-fit: cover;
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
      font-size: 40px;
      margin: 0 auto 10px;
    }
    
    h1 {
      margin: 10px 0 0;
      color: #333;
    }
    
    .profile-details {
      display: flex;
      flex-direction: column;
    }
    
    .detail-item {
      display: flex;
      margin-bottom: 12px;
      padding-bottom: 12px;
      border-bottom: 1px solid #eee;
    }
    
    .detail-item label {
      font-weight: bold;
      min-width: 120px;
      color: #555;
    }
    
    .detail-item:last-child {
      border-bottom: none;
    }
    
    .bio label {
      align-self: flex-start;
    }
    
    .bio p {
      margin: 0;
      flex: 1;
      color: #666;
    }
  `]
})
export class UserProfileComponent {
  @Input() user!: UserProfile;
}
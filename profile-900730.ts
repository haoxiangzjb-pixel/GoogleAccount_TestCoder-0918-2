import { Component, Input } from '@angular/core';

export interface UserProfile {
  id: number;
  name: string;
  email: string;
  phone: string;
  address?: string;
  avatar?: string;
  bio?: string;
}

@Component({
  selector: 'app-user-profile',
  template: `
    <div class="user-profile">
      <div class="profile-header">
        <img 
          *ngIf="user.avatar" 
          [src]="user.avatar" 
          alt="{{user.name}}'s avatar" 
          class="avatar">
        <div *ngIf="!user.avatar" class="default-avatar">
          {{ user.name.charAt(0) | uppercase }}
        </div>
        <h1>{{ user.name }}</h1>
      </div>
      
      <div class="profile-details">
        <div class="detail-item">
          <strong>Email:</strong>
          <span>{{ user.email }}</span>
        </div>
        
        <div class="detail-item">
          <strong>Phone:</strong>
          <span>{{ user.phone }}</span>
        </div>
        
        <div class="detail-item" *ngIf="user.address">
          <strong>Address:</strong>
          <span>{{ user.address }}</span>
        </div>
        
        <div class="detail-item bio" *ngIf="user.bio">
          <strong>About:</strong>
          <p>{{ user.bio }}</p>
        </div>
      </div>
    </div>
  `,
  styles: [`
    .user-profile {
      max-width: 500px;
      margin: 20px auto;
      padding: 20px;
      border: 1px solid #ddd;
      border-radius: 8px;
      font-family: Arial, sans-serif;
      box-shadow: 0 2px 10px rgba(0,0,0,0.1);
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
      margin-bottom: 10px;
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
      margin: 0;
      color: #333;
    }
    
    .profile-details {
      display: flex;
      flex-direction: column;
    }
    
    .detail-item {
      display: flex;
      margin-bottom: 10px;
      padding-bottom: 10px;
      border-bottom: 1px solid #eee;
    }
    
    .detail-item:last-child {
      border-bottom: none;
    }
    
    .detail-item strong {
      width: 100px;
      color: #555;
    }
    
    .bio p {
      margin: 0;
      color: #666;
      line-height: 1.5;
    }
  `]
})
export class UserProfileComponent {
  @Input() user!: UserProfile;
}
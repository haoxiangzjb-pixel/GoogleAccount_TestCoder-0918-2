import { Component, Input } from '@angular/core';

export interface UserProfile {
  id: number;
  name: string;
  email: string;
  username: string;
  bio?: string;
  avatar?: string;
  joinDate: Date;
  location?: string;
}

@Component({
  selector: 'app-user-profile',
  template: `
    <div class="profile-container">
      <div class="profile-header">
        <img 
          *ngIf="user.avatar" 
          [src]="user.avatar" 
          [alt]="user.name" 
          class="profile-avatar"
        >
        <div *ngIf="!user.avatar" class="default-avatar">
          {{ user.name.charAt(0).toUpperCase() }}
        </div>
        <div class="profile-info">
          <h1 class="profile-name">{{ user.name }}</h1>
          <p class="profile-username">@{{ user.username }}</p>
          <p class="profile-email">{{ user.email }}</p>
        </div>
      </div>
      
      <div class="profile-details">
        <div *ngIf="user.bio" class="bio-section">
          <h3>About</h3>
          <p>{{ user.bio }}</p>
        </div>
        
        <div class="info-section">
          <div *ngIf="user.location" class="info-item">
            <strong>Location:</strong> {{ user.location }}
          </div>
          <div class="info-item">
            <strong>Member since:</strong> {{ user.joinDate | date:'longDate' }}
          </div>
        </div>
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
      font-family: Arial, sans-serif;
      box-shadow: 0 2px 10px rgba(0,0,0,0.1);
    }
    
    .profile-header {
      display: flex;
      align-items: center;
      margin-bottom: 20px;
    }
    
    .profile-avatar {
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
      font-size: 40px;
      font-weight: bold;
      margin-right: 20px;
    }
    
    .profile-info {
      flex: 1;
    }
    
    .profile-name {
      margin: 0 0 5px 0;
      color: #333;
    }
    
    .profile-username {
      margin: 0 0 5px 0;
      color: #666;
      font-style: italic;
    }
    
    .profile-email {
      margin: 0;
      color: #888;
    }
    
    .bio-section h3 {
      margin-top: 0;
      border-bottom: 1px solid #eee;
      padding-bottom: 5px;
    }
    
    .info-section {
      margin-top: 15px;
    }
    
    .info-item {
      margin-bottom: 10px;
    }
  `]
})
export class UserProfileComponent {
  @Input() user!: UserProfile;
}
import { Component, Input } from '@angular/core';

interface UserProfile {
  id: number;
  name: string;
  email: string;
  avatar?: string;
  bio?: string;
  joinDate: string;
  location?: string;
}

@Component({
  selector: 'app-user-profile',
  template: `
    <div class="profile-container">
      <div class="profile-card">
        <div class="profile-header">
          <img 
            *ngIf="user.avatar" 
            [src]="user.avatar" 
            alt="{{user.name}}'s avatar" 
            class="avatar"
          >
          <div *ngIf="!user.avatar" class="default-avatar">
            {{ user.name.charAt(0) | uppercase }}
          </div>
          <h1 class="profile-name">{{ user.name }}</h1>
          <p class="profile-email">{{ user.email }}</p>
        </div>
        
        <div class="profile-details">
          <div *ngIf="user.bio" class="bio-section">
            <h3>About</h3>
            <p>{{ user.bio }}</p>
          </div>
          
          <div class="info-section">
            <div class="info-item" *ngIf="user.location">
              <strong>Location:</strong> {{ user.location }}
            </div>
            <div class="info-item">
              <strong>Member since:</strong> {{ user.joinDate | date:'longDate' }}
            </div>
          </div>
        </div>
      </div>
    </div>
  `,
  styles: [`
    .profile-container {
      display: flex;
      justify-content: center;
      padding: 20px;
    }
    
    .profile-card {
      background: white;
      border-radius: 10px;
      box-shadow: 0 4px 8px rgba(0,0,0,0.1);
      max-width: 500px;
      width: 100%;
      overflow: hidden;
    }
    
    .profile-header {
      text-align: center;
      padding: 30px 20px 20px;
      background: #f5f7fa;
      border-bottom: 1px solid #eee;
    }
    
    .avatar {
      width: 100px;
      height: 100px;
      border-radius: 50%;
      object-fit: cover;
      margin-bottom: 15px;
      border: 4px solid white;
      box-shadow: 0 2px 4px rgba(0,0,0,0.1);
    }
    
    .default-avatar {
      width: 100px;
      height: 100px;
      border-radius: 50%;
      background: #007bff;
      color: white;
      display: flex;
      align-items: center;
      justify-content: center;
      font-size: 40px;
      font-weight: bold;
      margin: 0 auto 15px;
      border: 4px solid white;
      box-shadow: 0 2px 4px rgba(0,0,0,0.1);
    }
    
    .profile-name {
      margin: 10px 0 5px;
      color: #333;
      font-size: 24px;
    }
    
    .profile-email {
      color: #666;
      margin: 0 0 15px;
      font-size: 16px;
    }
    
    .profile-details {
      padding: 20px;
    }
    
    .bio-section h3 {
      margin-top: 0;
      color: #333;
      border-bottom: 1px solid #eee;
      padding-bottom: 10px;
    }
    
    .info-section {
      margin-top: 20px;
    }
    
    .info-item {
      margin: 10px 0;
      padding: 8px 0;
    }
    
    .info-item strong {
      color: #555;
    }
  `]
})
export class UserProfileComponent {
  @Input() user: UserProfile = {
    id: 0,
    name: '',
    email: '',
    joinDate: new Date().toISOString()
  };
}
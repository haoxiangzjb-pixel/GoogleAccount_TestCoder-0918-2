import { Component, Input } from '@angular/core';

export interface UserProfile {
  id: number;
  firstName: string;
  lastName: string;
  email: string;
  phone?: string;
  avatar?: string;
  bio?: string;
  joinDate: string;
}

@Component({
  selector: 'app-user-profile',
  template: `
    <div class="user-profile">
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
        </div>
      </div>
      
      <div class="profile-details">
        <div *ngIf="user.bio" class="bio-section">
          <h3>About</h3>
          <p>{{ user.bio }}</p>
        </div>
        
        <div class="info-section">
          <h3>Member Since</h3>
          <p>{{ user.joinDate | date }}</p>
        </div>
      </div>
    </div>
  `,
  styles: [`
    .user-profile {
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
    
    .avatar {
      width: 80px;
      height: 80px;
      border-radius: 50%;
      margin-right: 20px;
      object-fit: cover;
    }
    
    .default-avatar {
      width: 80px;
      height: 80px;
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
      margin: 0 0 5px 0;
      color: #333;
    }
    
    .email {
      color: #666;
      margin: 5px 0;
    }
    
    .phone {
      color: #666;
      margin: 5px 0;
    }
    
    .profile-details h3 {
      color: #333;
      margin-bottom: 8px;
    }
    
    .bio-section, .info-section {
      margin-bottom: 20px;
    }
    
    .bio-section p {
      margin: 0;
      color: #555;
      line-height: 1.5;
    }
  `]
})
export class UserProfileComponent {
  @Input() user!: UserProfile;
}
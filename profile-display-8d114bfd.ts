import { Component, Input } from '@angular/core';

export interface UserProfile {
  id: number;
  name: string;
  email: string;
  avatar?: string;
  bio?: string;
  joinDate?: Date;
  location?: string;
}

@Component({
  selector: 'app-user-profile',
  template: `
    <div class="user-profile">
      <div class="profile-header">
        <img 
          *ngIf="user.avatar" 
          [src]="user.avatar" 
          [alt]="user.name" 
          class="avatar"
          (error)="onImageError($event)"
        >
        <div *ngIf="!user.avatar" class="default-avatar">
          {{ user.name.charAt(0).toUpperCase() }}
        </div>
        <div class="user-info">
          <h2>{{ user.name }}</h2>
          <p class="email">{{ user.email }}</p>
          <p *ngIf="user.location" class="location">📍 {{ user.location }}</p>
        </div>
      </div>
      
      <div class="profile-details">
        <div *ngIf="user.bio" class="bio">
          <h3>About</h3>
          <p>{{ user.bio }}</p>
        </div>
        
        <div *ngIf="user.joinDate" class="join-date">
          <h3>Member since</h3>
          <p>{{ user.joinDate | date:'longDate' }}</p>
        </div>
      </div>
    </div>
  `,
  styles: [`
    .user-profile {
      max-width: 500px;
      margin: 20px auto;
      padding: 20px;
      border: 1px solid #e0e0e0;
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
      width: 80px;
      height: 80px;
      border-radius: 50%;
      object-fit: cover;
      margin-right: 15px;
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
      font-size: 32px;
      font-weight: bold;
      margin-right: 15px;
    }
    
    .user-info h2 {
      margin: 0 0 5px 0;
      color: #333;
    }
    
    .email {
      color: #666;
      margin: 0 0 5px 0;
    }
    
    .location {
      color: #888;
      margin: 0;
    }
    
    .profile-details h3 {
      margin: 15px 0 5px 0;
      color: #555;
      font-size: 16px;
    }
    
    .bio p {
      margin: 0;
      color: #444;
      line-height: 1.5;
    }
    
    .join-date p {
      margin: 0;
      color: #666;
    }
  `]
})
export class UserProfileComponent {
  @Input() user!: UserProfile;
  
  onImageError(event: any) {
    event.target.style.display = 'none';
    const defaultAvatar = event.target.parentElement.querySelector('.default-avatar');
    if (defaultAvatar) {
      defaultAvatar.style.display = 'flex';
    }
  }
}
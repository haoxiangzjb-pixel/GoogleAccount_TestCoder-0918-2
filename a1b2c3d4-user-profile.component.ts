import { Component, Input } from '@angular/core';

export interface UserProfile {
  name: string;
  email: string;
  avatarUrl?: string;
  bio?: string;
  location?: string;
  website?: string;
}

@Component({
  selector: 'app-user-profile',
  template: `
    <div class="user-profile">
      <div class="profile-header">
        <img *ngIf="user.avatarUrl; else defaultAvatar" 
             [src]="user.avatarUrl" 
             alt="{{user.name}}'s avatar" 
             class="avatar">
        <ng-template #defaultAvatar>
          <div class="default-avatar">{{ getUserInitials() }}</div>
        </ng-template>
        <h2>{{ user.name }}</h2>
      </div>
      
      <div class="profile-details">
        <p class="email">
          <strong>Email:</strong> 
          <a [href]="'mailto:' + user.email">{{ user.email }}</a>
        </p>
        
        <p class="location" *ngIf="user.location">
          <strong>Location:</strong> {{ user.location }}
        </p>
        
        <p class="website" *ngIf="user.website">
          <strong>Website:</strong> 
          <a [href]="user.website" target="_blank">{{ user.website }}</a>
        </p>
        
        <p class="bio" *ngIf="user.bio">
          <strong>Bio:</strong> {{ user.bio }}
        </p>
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
      box-shadow: 0 2px 4px rgba(0,0,0,0.1);
      font-family: Arial, sans-serif;
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
      font-size: 36px;
      font-weight: bold;
      margin: 0 auto 10px;
    }
    
    h2 {
      margin: 0;
      color: #333;
    }
    
    .profile-details {
      text-align: left;
    }
    
    .profile-details p {
      margin: 10px 0;
    }
    
    .profile-details strong {
      display: inline-block;
      width: 70px;
      color: #555;
    }
    
    a {
      color: #007bff;
      text-decoration: none;
    }
    
    a:hover {
      text-decoration: underline;
    }
  `]
})
export class UserProfileComponent {
  @Input() user: UserProfile = {
    name: 'John Doe',
    email: 'john.doe@example.com'
  };

  getUserInitials(): string {
    if (!this.user.name) return '?';
    return this.user.name
      .split(' ')
      .map(n => n.charAt(0))
      .join('')
      .toUpperCase()
      .substring(0, 2);
  }
}
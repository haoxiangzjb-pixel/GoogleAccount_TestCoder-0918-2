import { Component, Input } from '@angular/core';

export interface User {
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
          class="profile-avatar"
        >
        <div *ngIf="!user.avatar" class="default-avatar">
          {{ user.name.charAt(0) | uppercase }}
        </div>
        <div class="user-info">
          <h2>{{ user.name }}</h2>
          <p class="email">{{ user.email }}</p>
          <p *ngIf="user.location" class="location">📍 {{ user.location }}</p>
        </div>
      </div>
      
      <div class="profile-details" *ngIf="user.bio || user.joinDate">
        <p *ngIf="user.bio">{{ user.bio }}</p>
        <p *ngIf="user.joinDate" class="join-date">
          Member since: {{ user.joinDate | date }}
        </p>
      </div>
    </div>
  `,
  styles: [`
    .user-profile {
      border: 1px solid #e0e0e0;
      border-radius: 8px;
      padding: 20px;
      max-width: 400px;
      background-color: #fff;
      box-shadow: 0 2px 4px rgba(0,0,0,0.1);
    }
    
    .profile-header {
      display: flex;
      align-items: center;
      margin-bottom: 15px;
    }
    
    .profile-avatar {
      width: 60px;
      height: 60px;
      border-radius: 50%;
      margin-right: 15px;
      object-fit: cover;
    }
    
    .default-avatar {
      width: 60px;
      height: 60px;
      border-radius: 50%;
      background-color: #007bff;
      color: white;
      display: flex;
      align-items: center;
      justify-content: center;
      font-size: 24px;
      font-weight: bold;
      margin-right: 15px;
    }
    
    .user-info h2 {
      margin: 0 0 5px 0;
      font-size: 1.5em;
    }
    
    .email {
      color: #666;
      margin: 0 0 5px 0;
    }
    
    .location {
      color: #888;
      margin: 0;
    }
    
    .profile-details p {
      margin: 10px 0;
      color: #555;
    }
    
    .join-date {
      font-size: 0.9em;
      color: #888;
      font-style: italic;
    }
  `]
})
export class UserProfileComponent {
  @Input() user!: User;
}
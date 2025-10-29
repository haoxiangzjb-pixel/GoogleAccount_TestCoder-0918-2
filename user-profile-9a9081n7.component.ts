import { Component, Input } from '@angular/core';

export interface UserProfile {
  id: number;
  name: string;
  email: string;
  avatar?: string;
  bio?: string;
  joinDate: Date;
  location?: string;
}

@Component({
  selector: 'app-user-profile',
  template: `
    <div class="user-profile-card">
      <div class="profile-banner">
        <div class="profile-picture">
          <img 
            *ngIf="user.avatar" 
            [src]="user.avatar" 
            [alt]="user.name" 
            class="avatar">
          <div *ngIf="!user.avatar" class="default-avatar">
            {{ user.name.charAt(0) | uppercase }}
          </div>
        </div>
      </div>
      
      <div class="profile-content">
        <h1 class="user-name">{{ user.name }}</h1>
        <div class="user-contact">
          <p class="email"><strong>Email:</strong> {{ user.email }}</p>
          <p *ngIf="user.location" class="location"><strong>Location:</strong> {{ user.location }}</p>
        </div>
        
        <div class="user-details">
          <div class="bio" *ngIf="user.bio">
            <h3>Bio</h3>
            <p>{{ user.bio }}</p>
          </div>
          
          <div class="member-since">
            <h3>Member Since</h3>
            <p>{{ user.joinDate | date:'longDate' }}</p>
          </div>
        </div>
      </div>
    </div>
  `,
  styles: [`
    .user-profile-card {
      max-width: 600px;
      margin: 20px auto;
      border-radius: 12px;
      overflow: hidden;
      box-shadow: 0 4px 12px rgba(0,0,0,0.1);
      background: white;
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    }
    
    .profile-banner {
      background: linear-gradient(135deg, #6a11cb 0%, #2575fc 100%);
      padding: 20px;
      text-align: center;
    }
    
    .profile-picture {
      display: inline-block;
      position: relative;
    }
    
    .avatar {
      width: 120px;
      height: 120px;
      border-radius: 50%;
      border: 4px solid white;
      object-fit: cover;
    }
    
    .default-avatar {
      width: 120px;
      height: 120px;
      border-radius: 50%;
      background-color: #fff;
      color: #2575fc;
      display: flex;
      align-items: center;
      justify-content: center;
      font-size: 50px;
      font-weight: bold;
      border: 4px solid white;
    }
    
    .profile-content {
      padding: 25px;
    }
    
    .user-name {
      margin: 10px 0 15px;
      color: #333;
      font-size: 28px;
      text-align: center;
    }
    
    .user-contact {
      border-bottom: 1px solid #eee;
      padding-bottom: 20px;
      margin-bottom: 20px;
    }
    
    .email, .location {
      margin: 8px 0;
      color: #555;
      font-size: 16px;
    }
    
    .user-details h3 {
      margin: 0 0 12px 0;
      color: #2575fc;
      font-size: 18px;
      border-bottom: 1px solid #eee;
      padding-bottom: 5px;
    }
    
    .bio p {
      margin: 0 0 15px 0;
      color: #666;
      line-height: 1.6;
    }
    
    .member-since p {
      margin: 0;
      color: #888;
      font-style: italic;
    }
  `]
})
export class UserProfile9a9081n7Component {
  @Input() user!: UserProfile;
}
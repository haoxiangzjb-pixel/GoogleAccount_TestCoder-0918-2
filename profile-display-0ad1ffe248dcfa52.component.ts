import { Component, Input } from '@angular/core';

interface User {
  id: number;
  firstName: string;
  lastName: string;
  email: string;
  username: string;
  avatar?: string;
  bio?: string;
  joinDate: string;
  location?: string;
  website?: string;
  socialLinks?: {
    twitter?: string;
    github?: string;
    linkedin?: string;
  };
}

@Component({
  selector: 'app-profile-display',
  template: `
    <div class="user-profile-wrapper">
      <div class="profile-card">
        <div class="profile-header">
          <div class="avatar-container">
            <img 
              *ngIf="user.avatar" 
              [src]="user.avatar" 
              [alt]="user.firstName + ' ' + user.lastName + ' avatar'" 
              class="avatar"
            >
            <div *ngIf="!user.avatar" class="default-avatar">
              {{ (user.firstName.charAt(0) + user.lastName.charAt(0)) | uppercase }}
            </div>
          </div>
          
          <div class="user-info">
            <h1 class="user-full-name">{{ user.firstName }} {{ user.lastName }}</h1>
            <h2 class="username">@{{ user.username }}</h2>
            <p class="user-email">{{ user.email }}</p>
          </div>
        </div>
        
        <div class="profile-body">
          <div *ngIf="user.bio" class="bio-section">
            <h3>Bio</h3>
            <p class="bio-text">{{ user.bio }}</p>
          </div>
          
          <div class="info-grid">
            <div *ngIf="user.location" class="info-item">
              <span class="info-label">Location:</span>
              <span class="info-value">{{ user.location }}</span>
            </div>
            
            <div *ngIf="user.website" class="info-item">
              <span class="info-label">Website:</span>
              <a [href]="user.website" target="_blank" class="info-value link">{{ user.website }}</a>
            </div>
            
            <div class="info-item">
              <span class="info-label">Member since:</span>
              <span class="info-value">{{ user.joinDate | date:'longDate' }}</span>
            </div>
          </div>
          
          <div *ngIf="user.socialLinks" class="social-links">
            <h3>Social Links</h3>
            <div class="links-container">
              <a *ngIf="user.socialLinks.twitter" [href]="user.socialLinks.twitter" target="_blank" class="social-link">
                Twitter
              </a>
              <a *ngIf="user.socialLinks.github" [href]="user.socialLinks.github" target="_blank" class="social-link">
                GitHub
              </a>
              <a *ngIf="user.socialLinks.linkedin" [href]="user.socialLinks.linkedin" target="_blank" class="social-link">
                LinkedIn
              </a>
            </div>
          </div>
        </div>
      </div>
    </div>
  `,
  styles: [`
    .user-profile-wrapper {
      display: flex;
      justify-content: center;
      padding: 20px;
      font-family: Arial, sans-serif;
    }
    
    .profile-card {
      background: #ffffff;
      border-radius: 12px;
      box-shadow: 0 6px 16px rgba(0, 0, 0, 0.1);
      max-width: 600px;
      width: 100%;
      overflow: hidden;
    }
    
    .profile-header {
      text-align: center;
      padding: 30px 20px 20px;
      background: linear-gradient(135deg, #6a11cb 0%, #2575fc 100%);
      color: white;
    }
    
    .avatar-container {
      margin-bottom: 15px;
    }
    
    .avatar {
      width: 120px;
      height: 120px;
      border-radius: 50%;
      object-fit: cover;
      border: 4px solid white;
      box-shadow: 0 4px 8px rgba(0,0,0,0.2);
    }
    
    .default-avatar {
      width: 120px;
      height: 120px;
      border-radius: 50%;
      background: #ffffff;
      color: #2575fc;
      display: flex;
      align-items: center;
      justify-content: center;
      font-size: 48px;
      font-weight: bold;
      margin: 0 auto;
      border: 4px solid white;
      box-shadow: 0 4px 8px rgba(0,0,0,0.2);
    }
    
    .user-full-name {
      margin: 10px 0 5px;
      font-size: 28px;
      font-weight: bold;
    }
    
    .username {
      margin: 0 0 5px;
      font-size: 18px;
      opacity: 0.9;
      font-weight: normal;
    }
    
    .user-email {
      margin: 0;
      font-size: 16px;
      opacity: 0.8;
    }
    
    .profile-body {
      padding: 30px;
    }
    
    .bio-section h3 {
      margin-top: 0;
      margin-bottom: 10px;
      color: #333;
      border-bottom: 1px solid #eee;
      padding-bottom: 8px;
    }
    
    .bio-text {
      color: #666;
      line-height: 1.6;
    }
    
    .info-grid {
      margin: 20px 0;
    }
    
    .info-item {
      display: flex;
      margin: 12px 0;
      padding: 8px 0;
      border-bottom: 1px solid #f5f5f5;
    }
    
    .info-label {
      font-weight: bold;
      color: #555;
      min-width: 120px;
      flex: 0 0 auto;
    }
    
    .info-value {
      color: #666;
      flex: 1;
    }
    
    .link {
      color: #2575fc;
      text-decoration: none;
    }
    
    .link:hover {
      text-decoration: underline;
    }
    
    .social-links h3 {
      margin-top: 0;
      margin-bottom: 15px;
      color: #333;
      border-bottom: 1px solid #eee;
      padding-bottom: 8px;
    }
    
    .links-container {
      display: flex;
      gap: 15px;
      flex-wrap: wrap;
    }
    
    .social-link {
      background: #f0f5ff;
      color: #2575fc;
      padding: 8px 16px;
      border-radius: 20px;
      text-decoration: none;
      font-size: 14px;
      transition: background 0.3s;
    }
    
    .social-link:hover {
      background: #d0e2ff;
      text-decoration: none;
    }
  `]
})
export class ProfileDisplay0ad1ffe248dcfa52Component {
  @Input() user: User = {
    id: 0,
    firstName: '',
    lastName: '',
    email: '',
    username: '',
    joinDate: new Date().toISOString()
  };
}
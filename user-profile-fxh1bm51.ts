import { Component, Input } from '@angular/core';

interface UserProfile {
  id: number;
  firstName: string;
  lastName: string;
  email: string;
  username: string;
  avatar?: string;
  bio?: string;
  joinDate: string;
  location?: string;
  socialLinks?: {
    twitter?: string;
    github?: string;
    linkedin?: string;
  };
}

@Component({
  selector: 'app-user-profile-fxh1bm51',
  template: `
    <div class="user-profile-card" *ngIf="profile">
      <div class="profile-header">
        <img 
          *ngIf="profile.avatar" 
          [src]="profile.avatar" 
          [alt]="profile.firstName + ' ' + profile.lastName" 
          class="avatar"
        >
        <div class="user-info">
          <h1>{{ profile.firstName }} {{ profile.lastName }}</h1>
          <h3>@{{ profile.username }}</h3>
          <p class="email">{{ profile.email }}</p>
        </div>
      </div>
      
      <div class="profile-body">
        <div class="bio" *ngIf="profile.bio">
          <h4>About</h4>
          <p>{{ profile.bio }}</p>
        </div>
        
        <div class="details">
          <div class="detail-item">
            <strong>Member since:</strong>
            <span>{{ profile.joinDate }}</span>
          </div>
          
          <div class="detail-item" *ngIf="profile.location">
            <strong>Location:</strong>
            <span>{{ profile.location }}</span>
          </div>
        </div>
        
        <div class="social-links" *ngIf="profile.socialLinks">
          <h4>Connect</h4>
          <div class="links">
            <a 
              *ngIf="profile.socialLinks.twitter" 
              [href]="profile.socialLinks.twitter" 
              target="_blank"
              class="social-link"
            >
              Twitter
            </a>
            <a 
              *ngIf="profile.socialLinks.github" 
              [href]="profile.socialLinks.github" 
              target="_blank"
              class="social-link"
            >
              GitHub
            </a>
            <a 
              *ngIf="profile.socialLinks.linkedin" 
              [href]="profile.socialLinks.linkedin" 
              target="_blank"
              class="social-link"
            >
              LinkedIn
            </a>
          </div>
        </div>
      </div>
    </div>
    
    <div *ngIf="!profile" class="no-profile">
      <p>User profile not available</p>
    </div>
  `,
  styles: [`
    .user-profile-card {
      max-width: 600px;
      margin: 20px auto;
      padding: 25px;
      box-shadow: 0 4px 8px rgba(0,0,0,0.1);
      border-radius: 12px;
      background: white;
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    }
    
    .profile-header {
      display: flex;
      align-items: center;
      gap: 20px;
      margin-bottom: 25px;
      padding-bottom: 20px;
      border-bottom: 1px solid #eee;
    }
    
    .avatar {
      width: 100px;
      height: 100px;
      border-radius: 50%;
      object-fit: cover;
      border: 3px solid #ddd;
    }
    
    .user-info h1 {
      margin: 0 0 5px 0;
      color: #333;
      font-size: 28px;
    }
    
    .user-info h3 {
      margin: 0 0 5px 0;
      color: #666;
      font-weight: normal;
    }
    
    .email {
      color: #007bff;
      margin: 0;
    }
    
    .profile-body {
      display: flex;
      flex-direction: column;
      gap: 20px;
    }
    
    .bio h4, .social-links h4 {
      margin: 0 0 10px 0;
      color: #333;
      border-bottom: 1px solid #eee;
      padding-bottom: 5px;
    }
    
    .bio p {
      margin: 0;
      color: #555;
      line-height: 1.6;
    }
    
    .details {
      display: flex;
      flex-direction: column;
      gap: 12px;
    }
    
    .detail-item {
      display: flex;
      justify-content: space-between;
      padding: 8px 0;
      border-bottom: 1px dashed #eee;
    }
    
    .detail-item strong {
      color: #555;
    }
    
    .detail-item span {
      color: #666;
    }
    
    .social-links .links {
      display: flex;
      gap: 15px;
    }
    
    .social-link {
      color: #007bff;
      text-decoration: none;
      padding: 6px 12px;
      border: 1px solid #007bff;
      border-radius: 4px;
      transition: all 0.3s ease;
    }
    
    .social-link:hover {
      background-color: #007bff;
      color: white;
    }
    
    .no-profile {
      text-align: center;
      padding: 40px;
      color: #666;
      font-size: 18px;
    }
  `]
})
export class UserProfileFxh1bm51Component {
  @Input() profile: UserProfile | null = null;
}
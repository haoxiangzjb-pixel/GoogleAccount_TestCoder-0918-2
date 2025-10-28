import { Component, OnInit } from '@angular/core';

interface UserProfile {
  id: number;
  name: string;
  email: string;
  avatar: string;
  bio: string;
  joinDate: Date;
  location: string;
  website?: string;
}

@Component({
  selector: 'app-user-profile',
  template: `
    <div class="profile-container">
      <div class="profile-card">
        <div class="profile-header">
          <img [src]="userProfile.avatar" [alt]="userProfile.name" class="profile-avatar">
          <div class="profile-basic-info">
            <h1>{{ userProfile.name }}</h1>
            <p class="profile-email">{{ userProfile.email }}</p>
            <p class="profile-join-date">Joined: {{ userProfile.joinDate | date:'longDate' }}</p>
          </div>
        </div>
        <div class="profile-details">
          <div class="detail-item">
            <strong>Location:</strong>
            <span>{{ userProfile.location }}</span>
          </div>
          <div class="detail-item" *ngIf="userProfile.website">
            <strong>Website:</strong>
            <a [href]="userProfile.website" target="_blank">{{ userProfile.website }}</a>
          </div>
          <div class="detail-item">
            <strong>Bio:</strong>
            <p class="profile-bio">{{ userProfile.bio }}</p>
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
      border-radius: 8px;
      box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
      max-width: 600px;
      width: 100%;
      overflow: hidden;
    }
    
    .profile-header {
      display: flex;
      padding: 30px;
      border-bottom: 1px solid #eee;
      align-items: center;
    }
    
    .profile-avatar {
      width: 100px;
      height: 100px;
      border-radius: 50%;
      object-fit: cover;
      margin-right: 20px;
    }
    
    .profile-basic-info h1 {
      margin: 0 0 10px 0;
      color: #333;
    }
    
    .profile-email {
      color: #666;
      margin: 0 0 5px 0;
    }
    
    .profile-join-date {
      color: #999;
      margin: 0;
      font-size: 0.9em;
    }
    
    .profile-details {
      padding: 20px 30px;
    }
    
    .detail-item {
      margin-bottom: 15px;
    }
    
    .detail-item strong {
      display: inline-block;
      width: 100px;
      color: #555;
    }
    
    .profile-bio {
      margin: 0;
      color: #666;
      line-height: 1.5;
    }
  `]
})
export class UserProfileComponent implements OnInit {
  userProfile: UserProfile = {
    id: 1,
    name: 'John Doe',
    email: 'john.doe@example.com',
    avatar: 'https://via.placeholder.com/150',
    bio: 'Software developer with a passion for creating amazing user experiences. I enjoy working with Angular, TypeScript, and modern web technologies.',
    joinDate: new Date('2022-01-15'),
    location: 'San Francisco, CA',
    website: 'https://johndoe.example.com'
  };

  constructor() { }

  ngOnInit(): void {
  }
}
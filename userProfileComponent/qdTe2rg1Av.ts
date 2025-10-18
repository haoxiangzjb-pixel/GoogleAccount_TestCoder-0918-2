import { Component } from '@angular/core';

export interface UserProfile {
  id: number;
  firstName: string;
  lastName: string;
  email: string;
  phone: string;
  address: string;
  bio: string;
  avatar: string;
}

@Component({
  selector: 'app-user-profile',
  template: `
    <div class="user-profile-container">
      <div class="profile-header">
        <img [src]="user.avatar" [alt]="'Profile of ' + user.firstName + ' ' + user.lastName" class="profile-avatar">
        <div class="profile-basic-info">
          <h1>{{ user.firstName }} {{ user.lastName }}</h1>
          <p class="user-email">{{ user.email }}</p>
        </div>
      </div>
      
      <div class="profile-details">
        <div class="detail-item">
          <label>Phone:</label>
          <span>{{ user.phone }}</span>
        </div>
        
        <div class="detail-item">
          <label>Address:</label>
          <span>{{ user.address }}</span>
        </div>
        
        <div class="detail-item">
          <label>Bio:</label>
          <p class="user-bio">{{ user.bio }}</p>
        </div>
      </div>
    </div>
  `,
  styles: [`
    .user-profile-container {
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
    
    .profile-basic-info h1 {
      margin: 0 0 5px 0;
      color: #333;
    }
    
    .user-email {
      color: #666;
      margin: 0;
    }
    
    .profile-details {
      margin-top: 20px;
    }
    
    .detail-item {
      margin-bottom: 15px;
      padding-bottom: 15px;
      border-bottom: 1px solid #eee;
    }
    
    .detail-item label {
      font-weight: bold;
      display: inline-block;
      width: 100px;
      color: #555;
    }
    
    .detail-item span {
      color: #333;
    }
    
    .user-bio {
      margin: 5px 0 0 100px;
      color: #666;
      line-height: 1.5;
    }
  `]
})
export class UserProfileComponent {
  user: UserProfile = {
    id: 1,
    firstName: 'John',
    lastName: 'Doe',
    email: 'john.doe@example.com',
    phone: '+1 (555) 123-4567',
    address: '123 Main St, New York, NY 10001',
    bio: 'Software developer with 5 years of experience in web technologies. Passionate about creating user-friendly applications.',
    avatar: 'https://via.placeholder.com/100x100/007bff/ffffff?text=JD'
  };
}
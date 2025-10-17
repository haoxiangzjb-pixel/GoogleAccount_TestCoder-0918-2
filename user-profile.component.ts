import { Component, Input } from '@angular/core';

interface User {
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
    <div class="profile-container">
      <div class="profile-header">
        <img [src]="user.avatar || 'https://via.placeholder.com/150'" alt="User Avatar" class="avatar">
        <h1>{{ user.firstName }} {{ user.lastName }}</h1>
      </div>
      
      <div class="profile-details">
        <div class="detail-item">
          <strong>Email:</strong> {{ user.email }}
        </div>
        <div class="detail-item">
          <strong>Phone:</strong> {{ user.phone }}
        </div>
        <div class="detail-item">
          <strong>Address:</strong> {{ user.address }}
        </div>
        <div class="detail-item">
          <strong>Bio:</strong> {{ user.bio }}
        </div>
      </div>
    </div>
  `,
  styles: [`
    .profile-container {
      max-width: 600px;
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
    
    .profile-details {
      margin-top: 20px;
    }
    
    .detail-item {
      margin-bottom: 10px;
      padding: 8px 0;
      border-bottom: 1px solid #eee;
    }
  `]
})
export class UserProfileComponent {
  @Input() user!: User;
  
  constructor() { }
}
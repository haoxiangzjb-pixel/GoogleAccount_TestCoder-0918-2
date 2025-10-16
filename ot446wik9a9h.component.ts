import { Component, Input } from '@angular/core';

export interface UserProfile {
  id: number;
  name: string;
  email: string;
  phone: string;
  website: string;
  address?: {
    street: string;
    city: string;
    zipcode: string;
  };
  company?: {
    name: string;
    catchPhrase: string;
  };
}

@Component({
  selector: 'app-user-profile',
  template: `
    <div class="user-profile">
      <div class="profile-header">
        <h2>{{ userProfile?.name || 'User Profile' }}</h2>
      </div>
      <div class="profile-details">
        <div class="detail-item">
          <label>ID:</label>
          <span>{{ userProfile?.id }}</span>
        </div>
        <div class="detail-item">
          <label>Name:</label>
          <span>{{ userProfile?.name }}</span>
        </div>
        <div class="detail-item">
          <label>Email:</label>
          <span>{{ userProfile?.email }}</span>
        </div>
        <div class="detail-item">
          <label>Phone:</label>
          <span>{{ userProfile?.phone }}</span>
        </div>
        <div class="detail-item">
          <label>Website:</label>
          <span>{{ userProfile?.website }}</span>
        </div>
        <div class="detail-item" *ngIf="userProfile?.address">
          <label>Address:</label>
          <div class="address-details">
            <p>{{ userProfile?.address?.street }}</p>
            <p>{{ userProfile?.address?.city }}, {{ userProfile?.address?.zipcode }}</p>
          </div>
        </div>
        <div class="detail-item" *ngIf="userProfile?.company">
          <label>Company:</label>
          <div class="company-details">
            <p>{{ userProfile?.company?.name }}</p>
            <p>{{ userProfile?.company?.catchPhrase }}</p>
          </div>
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
    }
    
    .profile-header h2 {
      margin-top: 0;
      color: #333;
      border-bottom: 2px solid #007bff;
      padding-bottom: 10px;
    }
    
    .profile-details {
      display: flex;
      flex-direction: column;
    }
    
    .detail-item {
      display: flex;
      margin-bottom: 10px;
      padding-bottom: 10px;
      border-bottom: 1px solid #eee;
    }
    
    .detail-item label {
      font-weight: bold;
      min-width: 100px;
      color: #555;
    }
    
    .detail-item span {
      flex: 1;
      color: #333;
    }
    
    .address-details p,
    .company-details p {
      margin: 5px 0;
    }
  `]
})
export class UserProfileComponent {
  @Input() userProfile: UserProfile | undefined;
}
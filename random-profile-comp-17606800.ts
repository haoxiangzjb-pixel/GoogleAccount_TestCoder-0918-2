import { Component, Input } from '@angular/core';

interface User {
  id: number;
  name: string;
  email: string;
  username: string;
  phone: string;
  website: string;
  company?: {
    name: string;
    catchPhrase?: string;
    bs?: string;
  };
  address?: {
    street: string;
    suite: string;
    city: string;
    zipcode: string;
    geo?: {
      lat: string;
      lng: string;
    };
  };
}

@Component({
  selector: 'app-user-profile',
  template: `
    <div class="user-profile" *ngIf="user">
      <div class="profile-header">
        <h2>{{ user.name }}</h2>
        <p class="username">@{{ user.username }}</p>
      </div>
      
      <div class="profile-details">
        <div class="detail-item">
          <strong>Email:</strong> {{ user.email }}
        </div>
        <div class="detail-item">
          <strong>Phone:</strong> {{ user.phone }}
        </div>
        <div class="detail-item">
          <strong>Website:</strong> <a [href]="'http://' + user.website" target="_blank">{{ user.website }}</a>
        </div>
        
        <div class="address-section" *ngIf="user.address">
          <h3>Address</h3>
          <div class="detail-item">
            {{ user.address?.street }}, {{ user.address?.suite }}
          </div>
          <div class="detail-item">
            {{ user.address?.city }}, {{ user.address?.zipcode }}
          </div>
          <div class="detail-item" *ngIf="user.address?.geo">
            <strong>Coordinates:</strong> ({{ user.address?.geo?.lat }}, {{ user.address?.geo?.lng }})
          </div>
        </div>
        
        <div class="company-section" *ngIf="user.company">
          <h3>Company</h3>
          <div class="detail-item">
            <strong>Name:</strong> {{ user.company?.name }}
          </div>
          <div class="detail-item" *ngIf="user.company?.catchPhrase">
            <strong>Catch Phrase:</strong> {{ user.company?.catchPhrase }}
          </div>
          <div class="detail-item" *ngIf="user.company?.bs">
            <strong>Business:</strong> {{ user.company?.bs }}
          </div>
        </div>
      </div>
    </div>
    
    <div *ngIf="!user" class="no-user">
      No user data available
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
      box-shadow: 0 2px 4px rgba(0,0,0,0.1);
    }
    
    .profile-header {
      text-align: center;
      margin-bottom: 20px;
      border-bottom: 1px solid #eee;
      padding-bottom: 15px;
    }
    
    .profile-header h2 {
      margin: 0;
      color: #333;
    }
    
    .username {
      color: #666;
      font-style: italic;
    }
    
    .profile-details {
      display: flex;
      flex-direction: column;
    }
    
    .detail-item {
      margin: 8px 0;
      padding: 8px 0;
      border-bottom: 1px solid #f5f5f5;
    }
    
    .address-section, .company-section {
      margin-top: 15px;
      padding-top: 15px;
      border-top: 1px solid #eee;
    }
    
    .address-section h3, .company-section h3 {
      margin-top: 0;
      color: #444;
    }
    
    .no-user {
      text-align: center;
      color: #999;
      font-style: italic;
      padding: 20px;
    }
  `]
})
export class UserProfileComponent {
  @Input() user: User | null = null;
}
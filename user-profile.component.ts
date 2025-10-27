import { Component, Input } from '@angular/core';

interface User {
  id: number;
  name: string;
  email: string;
  username: string;
  phone: string;
  website: string;
  address?: {
    street: string;
    suite: string;
    city: string;
    zipcode: string;
  };
  company?: {
    name: string;
    catchPhrase: string;
    bs: string;
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
          <strong>Email:</strong>
          <a [href]="'mailto:' + user.email">{{ user.email }}</a>
        </div>
        
        <div class="detail-item">
          <strong>Phone:</strong>
          <a [href]="'tel:' + user.phone">{{ user.phone }}</a>
        </div>
        
        <div class="detail-item">
          <strong>Website:</strong>
          <a [href]="'https://' + user.website" target="_blank">{{ user.website }}</a>
        </div>
        
        <div class="detail-item" *ngIf="user.address">
          <strong>Address:</strong>
          <div>
            {{ user.address.street }}, {{ user.address.suite }}<br>
            {{ user.address.city }}, {{ user.address.zipcode }}
          </div>
        </div>
        
        <div class="detail-item" *ngIf="user.company">
          <strong>Company:</strong>
          <div>
            {{ user.company.name }}<br>
            <em>{{ user.company.catchPhrase }}</em>
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
      max-width: 500px;
      margin: 20px auto;
      padding: 20px;
      border: 1px solid #ddd;
      border-radius: 8px;
      font-family: Arial, sans-serif;
    }
    
    .profile-header h2 {
      margin: 0 0 5px 0;
      color: #333;
    }
    
    .username {
      color: #666;
      margin: 0 0 15px 0;
    }
    
    .profile-details {
      display: flex;
      flex-direction: column;
      gap: 12px;
    }
    
    .detail-item {
      display: flex;
      flex-direction: column;
      gap: 4px;
    }
    
    .detail-item strong {
      color: #555;
    }
    
    .detail-item a {
      color: #007bff;
      text-decoration: none;
    }
    
    .detail-item a:hover {
      text-decoration: underline;
    }
    
    .no-user {
      text-align: center;
      padding: 20px;
      color: #666;
    }
  `]
})
export class UserProfileComponent {
  @Input() user: User | null = null;
}
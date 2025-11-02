import { Component, OnInit } from '@angular/core';

export interface User {
  id: number;
  name: string;
  email: string;
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
  };
}

@Component({
  selector: 'app-user-profile',
  template: `
    <div class="user-profile">
      <h2>User Profile</h2>
      <div *ngIf="user" class="profile-card">
        <div class="profile-header">
          <h3>{{ user.name }}</h3>
        </div>
        <div class="profile-details">
          <p><strong>ID:</strong> {{ user.id }}</p>
          <p><strong>Name:</strong> {{ user.name }}</p>
          <p><strong>Email:</strong> <a href="mailto:{{ user.email }}">{{ user.email }}</a></p>
          <p><strong>Phone:</strong> {{ user.phone }}</p>
          <p><strong>Website:</strong> <a href="http://{{ user.website }}" target="_blank">{{ user.website }}</a></p>
          <div *ngIf="user.address" class="address-section">
            <h4>Address</h4>
            <p>{{ user.address.street }}, {{ user.address.suite }}</p>
            <p>{{ user.address.city }}, {{ user.address.zipcode }}</p>
          </div>
          <div *ngIf="user.company" class="company-section">
            <h4>Company</h4>
            <p>{{ user.company.name }}</p>
          </div>
        </div>
      </div>
      <div *ngIf="!user" class="no-user">
        <p>Loading user profile...</p>
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
    
    .profile-card {
      background-color: #f9f9f9;
      padding: 15px;
      border-radius: 5px;
    }
    
    .profile-header h3 {
      margin-top: 0;
      color: #333;
    }
    
    .profile-details p {
      margin: 8px 0;
    }
    
    .address-section, .company-section {
      margin-top: 15px;
      padding-top: 10px;
      border-top: 1px solid #eee;
    }
    
    .no-user {
      text-align: center;
      color: #666;
    }
  `]
})
export class UserProfileComponent implements OnInit {
  user: User | null = null;

  ngOnInit(): void {
    // Simulate loading user data
    this.loadUserProfile();
  }

  loadUserProfile(): void {
    // In a real application, this would fetch data from a service
    setTimeout(() => {
      this.user = {
        id: 1,
        name: 'John Doe',
        email: 'john.doe@example.com',
        phone: '1-234-567-8900',
        website: 'johndoe.example.com',
        address: {
          street: 'Kulas Light',
          suite: 'Apt. 556',
          city: 'Gwenborough',
          zipcode: '92998-3874'
        },
        company: {
          name: 'Romaguera-Crona'
        }
      };
    }, 500);
  }
}
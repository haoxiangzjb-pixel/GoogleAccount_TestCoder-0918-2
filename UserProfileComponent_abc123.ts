import { Component } from '@angular/core';

export interface User {
  id: number;
  name: string;
  email: string;
  role: string;
}

@Component({
  selector: 'app-user-profile',
  template: `
    <div class="user-profile">
      <h2>User Profile</h2>
      <div class="profile-details">
        <p><strong>ID:</strong> {{ user.id }}</p>
        <p><strong>Name:</strong> {{ user.name }}</p>
        <p><strong>Email:</strong> {{ user.email }}</p>
        <p><strong>Role:</strong> {{ user.role }}</p>
      </div>
    </div>
  `,
  styles: [`
    .user-profile {
      border: 1px solid #ccc;
      padding: 16px;
      border-radius: 8px;
      max-width: 400px;
      margin: 20px auto;
    }
    .profile-details p {
      margin: 8px 0;
    }
  `]
})
export class UserProfileComponent {
  user: User = {
    id: 1,
    name: 'John Doe',
    email: 'john.doe@example.com',
    role: 'Admin'
  };
}
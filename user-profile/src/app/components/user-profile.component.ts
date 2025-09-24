import { Component, Input } from '@angular/core';

interface User {
  id: number;
  name: string;
  email: string;
  role: string;
}

@Component({
  selector: 'app-user-profile',
  template: `
    <div class="profile-card">
      <h2>User Profile</h2>
      <div *ngIf="user">
        <p><strong>ID:</strong> {{ user.id }}</p>
        <p><strong>Name:</strong> {{ user.name }}</p>
        <p><strong>Email:</strong> {{ user.email }}</p>
        <p><strong>Role:</strong> {{ user.role }}</p>
      </div>
      <p *ngIf="!user">No user data available.</p>
    </div>
  `,
  styles: [`
    .profile-card {
      border: 1px solid #ccc;
      padding: 16px;
      margin: 8px;
      max-width: 400px;
      box-shadow: 0 2px 4px rgba(0,0,0,0.1);
    }
  `]
})
export class UserProfileComponent {
  @Input() user: User | undefined;
}
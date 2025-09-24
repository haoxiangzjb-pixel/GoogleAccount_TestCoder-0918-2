import { Component, Input } from '@angular/core';

export interface User {
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
      <p><strong>ID:</strong> {{ user.id }}</p>
      <p><strong>Name:</strong> {{ user.name }}</p>
      <p><strong>Email:</strong> {{ user.email }}</p>
      <p><strong>Role:</strong> {{ user.role }}</p>
    </div>
  `,
  styles: [`
    .profile-card {
      border: 1px solid #ddd;
      padding: 16px;
      margin: 8px;
      border-radius: 4px;
      max-width: 300px;
    }
  `]
})
export class UserProfileComponent {
  @Input() user!: User;
 // A real app would fetch this data
}
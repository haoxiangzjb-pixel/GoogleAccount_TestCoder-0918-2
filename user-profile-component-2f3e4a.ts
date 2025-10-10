import { Component, Input } from '@angular/core';

export interface UserProfile {
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
      <div class="profile-info">
        <p><strong>ID:</strong> {{ user.id }}</p>
        <p><strong>Name:</strong> {{ user.name }}</p>
        <p><strong>Email:</strong> {{ user.email }}</p>
        <p><strong>Role:</strong> {{ user.role }}</p>
      </div>
    </div>
  `,
  styles: [`
    .profile-card {
      border: 1px solid #ccc;
      padding: 16px;
      margin: 8px;
      border-radius: 8px;
      max-width: 400px;
      box-shadow: 0 2px 4px rgba(0,0,0,0.1);
    }
    .profile-info p {
      margin: 8px 0;
    }
  `]
})
export class UserProfileComponent {
  @Input() user!: UserProfile;
 // Use the non-null assertion operator as the parent will always provide this.
}

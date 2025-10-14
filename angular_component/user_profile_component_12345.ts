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
    <div class="user-profile">
      <h2>User Profile</h2>
      <div *ngIf="profile; else noProfile">
        <p><strong>ID:</strong> {{ profile.id }}</p>
        <p><strong>Name:</strong> {{ profile.name }}</p>
        <p><strong>Email:</strong> {{ profile.email }}</p>
        <p><strong>Role:</strong> {{ profile.role }}</p>
      </div>
      <ng-template #noProfile>
        <p>No profile data available.</p>
      </ng-template>
    </div>
  `,
  styles: [`
    .user-profile {
      border: 1px solid #ccc;
      padding: 16px;
      border-radius: 4px;
      max-width: 400px;
    }
  `]
})
export class UserProfileComponent {
  @Input() profile?: UserProfile;
}
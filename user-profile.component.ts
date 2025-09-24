import { Component, Input } from '@angular/core';

export interface UserProfile {
  id: number;
  name: string;
  email: string;
  bio?: string;
}

@Component({
  selector: 'app-user-profile',
  template: `
    <div class="profile-card" *ngIf="user">
      <h2>{{ user.name }}</h2>
      <p>Email: {{ user.email }}</p>
      <p *ngIf="user.bio">Bio: {{ user.bio }}</p>
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
  @Input() user: UserProfile | undefined;
}
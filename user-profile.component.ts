import { Component, Input } from '@angular/core';

export interface UserProfile {
  id: number;
  name: string;
  email: string;
  avatarUrl?: string;
  bio?: string;
  joinDate?: string;
}

@Component({
  selector: 'app-user-profile',
  template: `
    <div class="user-profile">
      <div class="profile-header">
        <img *ngIf="user.avatarUrl; else defaultAvatar" 
             [src]="user.avatarUrl" 
             alt="{{user.name}}'s avatar" 
             class="avatar">
        <ng-template #defaultAvatar>
          <div class="default-avatar">{{ getUserInitials() }}</div>
        </ng-template>
        <h2>{{ user.name }}</h2>
      </div>
      
      <div class="profile-details">
        <p><strong>Email:</strong> {{ user.email }}</p>
        <p *ngIf="user.bio"><strong>Bio:</strong> {{ user.bio }}</p>
        <p *ngIf="user.joinDate"><strong>Member since:</strong> {{ user.joinDate | date }}</p>
      </div>
    </div>
  `,
  styles: [`
    .user-profile {
      border: 1px solid #ddd;
      border-radius: 8px;
      padding: 20px;
      max-width: 400px;
      font-family: Arial, sans-serif;
    }
    
    .profile-header {
      text-align: center;
      margin-bottom: 20px;
    }
    
    .avatar {
      width: 100px;
      height: 100px;
      border-radius: 50%;
      object-fit: cover;
    }
    
    .default-avatar {
      width: 100px;
      height: 100px;
      border-radius: 50%;
      background-color: #007bff;
      color: white;
      display: flex;
      align-items: center;
      justify-content: center;
      font-size: 36px;
      font-weight: bold;
      margin: 0 auto;
    }
    
    .profile-details p {
      margin: 10px 0;
    }
  `]
})
export class UserProfileComponent {
  @Input() user: UserProfile = {
    id: 0,
    name: '',
    email: ''
  };

  getUserInitials(): string {
    const names = this.user.name.split(' ');
    const initials = names.map(n => n.charAt(0)).join('');
    return initials.toUpperCase();
  }
}
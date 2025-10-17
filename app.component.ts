import { Component } from '@angular/core';

interface User {
  id: number;
  firstName: string;
  lastName: string;
  email: string;
  phone: string;
  address: string;
  bio: string;
  avatar: string;
}

@Component({
  selector: 'app-root',
  template: `
    <div class="app-container">
      <h1>User Profile Demo</h1>
      <app-user-profile [user]="sampleUser"></app-user-profile>
    </div>
  `,
  styles: [`
    .app-container {
      padding: 20px;
    }
    
    h1 {
      text-align: center;
      color: #333;
    }
  `]
})
export class AppComponent {
  sampleUser: User = {
    id: 1,
    firstName: 'John',
    lastName: 'Doe',
    email: 'john.doe@example.com',
    phone: '+1-234-567-8900',
    address: '123 Main Street, New York, NY',
    bio: 'Software developer with 5 years of experience in web technologies.',
    avatar: 'https://via.placeholder.com/150/4285f4/ffffff?text=JD'
  };
}
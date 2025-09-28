import { Component, Input } from '@angular/core';

interface User {
  id: number;
  name: string;
  email: string;
  avatar?: string; // Optional property
}

@Component({
  selector: 'app-user-profile',
  templateUrl: './user-profile.component.html',
  styleUrls: ['./user-profile.component.css']
})
export class UserProfileComponent {
  @Input() user: User | undefined;
}
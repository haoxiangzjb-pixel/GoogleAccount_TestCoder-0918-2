import { Component, Input } from '@angular/core';
import { UserProfile } from './user-profile.interface';

@Component({
  selector: 'app-user-profile',
  templateUrl: './user-profile.component.html',
  styleUrls: ['./user-profile.component.css']
})
export class UserProfileComponent {
  @Input() userProfile: UserProfile = {
    name: 'John Doe',
    email: 'john.doe@example.com',
    avatar: 'https://via.placeholder.com/150',
    bio: 'Software developer with a passion for creating amazing web applications.',
    joinDate: new Date('2023-01-15')
  };

  get joinDateFormatted(): string {
    return this.userProfile.joinDate.toLocaleDateString();
  }
}
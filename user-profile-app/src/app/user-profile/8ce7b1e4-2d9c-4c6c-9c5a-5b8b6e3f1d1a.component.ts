import { Component, OnInit } from '@angular/core';

export interface User {
  id: number;
  name: string;
  email: string;
  username: string;
  bio?: string; // Optional property
}

@Component({
  selector: 'app-user-profile',
  templateUrl: './user-profile.component.html',
  styleUrls: ['./user-profile.component.css']
})
export class UserProfileComponent implements OnInit {
  user: User = {
    id: 1,
    name: 'John Doe',
    email: 'john.doe@example.com',
    username: 'johndoe',
    bio: 'Software Developer'
  };

  constructor() { }

  ngOnInit(): void {
  }

}
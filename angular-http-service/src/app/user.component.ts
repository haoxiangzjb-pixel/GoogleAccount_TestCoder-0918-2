import { Component, OnInit } from '@angular/core';
import { DataHttpService, UserData } from './services/data-http.service';

@Component({
  selector: 'app-user',
  template: `
    <div>
      <h2>Users</h2>
      <ul>
        <li *ngFor="let user of users">
          {{ user.name }} ({{ user.email }})
        </li>
      </ul>
      
      <h2>Create User</h2>
      <form (ngSubmit)="onSubmit()">
        <input [(ngModel)]="newUser.name" placeholder="Name" required>
        <input [(ngModel)]="newUser.email" placeholder="Email" required>
        <button type="submit">Create</button>
      </form>
    </div>
  `
})
export class UserComponent implements OnInit {
  users: UserData[] = [];
  newUser: Omit<UserData, 'id'> = { name: '', email: '' };

  constructor(private dataService: DataHttpService) {}

  ngOnInit(): void {
    this.loadUsers();
  }

  loadUsers(): void {
    this.dataService.getUsers().subscribe(
      (users) => {
        this.users = users;
      },
      (error) => {
        console.error('Error loading users:', error);
      }
    );
  }

  onSubmit(): void {
    this.dataService.createUser(this.newUser).subscribe(
      (user) => {
        this.users.push(user);
        this.newUser = { name: '', email: '' };
      },
      (error) => {
        console.error('Error creating user:', error);
      }
    );
  }
}
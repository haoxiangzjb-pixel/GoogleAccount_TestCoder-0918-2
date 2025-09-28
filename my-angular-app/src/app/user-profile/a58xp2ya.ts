export interface User {
  id: number;
  name: string;
  email: string;
  role: string;
}

export class UserProfileComponent {
  user: User = {
    id: 1,
    name: 'John Doe',
    email: 'john.doe@example.com',
    role: 'Admin'
  };

  constructor() {}

  ngOnInit(): void {
    // Initialization logic can go here
  }
}
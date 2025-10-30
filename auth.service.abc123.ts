import { Injectable } from '@angular/core';
import { BehaviorSubject, Observable } from 'rxjs';

export interface User {
  id: string;
  username: string;
  email: string;
}

@Injectable({
  providedIn: 'root'
})
export class AuthService {
  private currentUserSubject = new BehaviorSubject<User | null>(null);
  public currentUser$ = this.currentUserSubject.asObservable();

  constructor() { }

  login(username: string, password: string): Observable<boolean> {
    // Simulación de autenticación
    return new Observable(observer => {
      setTimeout(() => {
        if (username && password) {
          const mockUser: User = {
            id: '1',
            username: username,
            email: `${username}@example.com`
          };
          this.currentUserSubject.next(mockUser);
          observer.next(true);
          observer.complete();
        } else {
          observer.next(false);
          observer.complete();
        }
      }, 1000);
    });
  }

  logout(): void {
    this.currentUserSubject.next(null);
  }

  isAuthenticated(): boolean {
    return this.currentUserSubject.value !== null;
  }

  getCurrentUser(): User | null {
    return this.currentUserSubject.value;
  }

  register(userData: { username: string; email: string; password: string }): Observable<boolean> {
    // Simulación de registro
    return new Observable(observer => {
      setTimeout(() => {
        // En una implementación real, aquí se haría la llamada al backend
        observer.next(true);
        observer.complete();
      }, 1000);
    });
  }
}
import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { HttpClientModule } from '@angular/common/http'; // Импортируем HttpClientModule

import { AppComponent } from './app.component'; // Предполагаем, что компонент существует

@NgModule({
  declarations: [
    AppComponent
  ],
  imports: [
    BrowserModule,
    HttpClientModule // Добавляем в imports
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
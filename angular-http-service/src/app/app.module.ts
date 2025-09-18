import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { HttpClientModule } from '@angular/common/http';
import { FormsModule } from '@angular/forms';

import { DataHttpService } from './services/data-http.service';
import { UserComponent } from './user.component';

@NgModule({
  declarations: [
    UserComponent
  ],
  imports: [
    BrowserModule,
    HttpClientModule,
    FormsModule
  ],
  providers: [DataHttpService],
  bootstrap: [UserComponent]
})
export class AppModule { }
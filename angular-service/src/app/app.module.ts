import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { HttpClientModule } from '@angular/common/http';

import { RandomServiceBObvMbYOn9 } from './services/random-service-BObvMbYOn9.service';

@NgModule({
  imports: [
    BrowserModule,
    HttpClientModule
  ],
  providers: [
    RandomServiceBObvMbYOn9
  ],
  bootstrap: []
})
export class AppModule { }
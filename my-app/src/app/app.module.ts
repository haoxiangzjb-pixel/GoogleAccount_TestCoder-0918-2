import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { HttpClientModule } from '@angular/common/http';

import { AppComponent } from './app.component';
import { DataFetchYlg3yqhYL5Service } from './services/data-fetch-ylg3yqhYL5.service';

@NgModule({
  declarations: [
    AppComponent
  ],
  imports: [
    BrowserModule,
    HttpClientModule
  ],
  providers: [DataFetchYlg3yqhYL5Service],
  bootstrap: [AppComponent]
})
export class AppModule { }
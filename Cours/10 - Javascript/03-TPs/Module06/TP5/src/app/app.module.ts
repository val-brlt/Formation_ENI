import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppComponent } from './app.component';
import { HeaderComponent } from './header/header.component';
import { ContLeftComponent } from './cont-left/cont-left.component';
import { ContRightUpComponent } from './cont-right-up/cont-right-up.component';
import { ContRightDownComponent } from './cont-right-down/cont-right-down.component';

@NgModule({
  declarations: [
    AppComponent,
    HeaderComponent,
    ContLeftComponent,
    ContRightUpComponent,
    ContRightDownComponent
  ],
  imports: [
    BrowserModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }

import { NgModule } from '@angular/core';
import { MontrealComponent } from './montreal/montreal.component';
import { AngularMaterialModule } from '../angular-material.module';
import { CommonModule } from '@angular/common';
import { FormsRoutingModule } from './forms-routing.module';

@NgModule({
  declarations: [
    MontrealComponent
  ],
  imports: [
    CommonModule,
    AngularMaterialModule,
    FormsRoutingModule
  ]
})
export class FormulariosModule {}
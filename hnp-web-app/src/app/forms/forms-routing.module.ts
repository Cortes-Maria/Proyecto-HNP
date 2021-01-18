import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { MontrealComponent } from './montreal/montreal.component';

const routes: Routes = [
  { path: 'montreal', component: MontrealComponent }
];

@NgModule({
  imports: [
    RouterModule.forChild(routes)
  ],
  exports: [RouterModule]
})
export class FormsRoutingModule {}
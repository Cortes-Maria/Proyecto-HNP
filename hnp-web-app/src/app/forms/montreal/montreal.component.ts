import { Component, OnInit, OnDestroy } from '@angular/core';
import { AuthServices } from '../../auth/auth.service';
import { Subscription } from 'rxjs';

@Component({
  selector: 'app-form-montreal',
  templateUrl: './montreal.component.html',
  styleUrls: ['./montreal.component.css']
})
export class MontrealComponent implements OnInit, OnDestroy {
  private authListenerSubs: Subscription;
  //userIsAuthenticated = false;

  constructor(private authService: AuthServices) { }

  ngOnInit() {
    // this.userIsAuthenticated = this.authService.getIsAuth();
    // this.authListenerSubs = this.authService.getAuthStatusListener().subscribe(isAuthenticated => {
    //   this.userIsAuthenticated = isAuthenticated;
    // });
  }

  ngOnDestroy() {
    //this.authListenerSubs.unsubscribe();
  }
}
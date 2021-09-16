import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ContRightUpComponent } from './cont-right-up.component';

describe('ContRightUpComponent', () => {
  let component: ContRightUpComponent;
  let fixture: ComponentFixture<ContRightUpComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ContRightUpComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(ContRightUpComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ContLeftComponent } from './cont-left.component';

describe('ContLeftComponent', () => {
  let component: ContLeftComponent;
  let fixture: ComponentFixture<ContLeftComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ContLeftComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(ContLeftComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

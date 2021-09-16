import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ContRightDownComponent } from './cont-right-down.component';

describe('ContRightDownComponent', () => {
  let component: ContRightDownComponent;
  let fixture: ComponentFixture<ContRightDownComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ContRightDownComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(ContRightDownComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

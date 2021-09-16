import { ComponentFixture, TestBed } from '@angular/core/testing';

import { FirstComposantComponent } from './first-composant.component';

describe('FirstComposantComponent', () => {
  let component: FirstComposantComponent;
  let fixture: ComponentFixture<FirstComposantComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ FirstComposantComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(FirstComposantComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

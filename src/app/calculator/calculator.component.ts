import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-calculator',
  templateUrl: './calculator.component.html',
  styleUrls: ['./calculator.component.css']
})
export class CalculatorComponent implements OnInit {
  public resistance: number;
  public tolerance: number;
  public colors=['Black','Brown','Red','Orange','Yellow','Green','Blue','Violet','Grey','Gold','Silver','None'];

  constructor() { }

  ngOnInit(): void {
  }

}

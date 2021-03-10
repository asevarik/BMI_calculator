import 'package:bmi_calculator/Contants.dart';

import 'main.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  double bmi = 26.7;
  final String bmiresult;
  final String resultText;
  final String interpretation;
  ResultPage(@required this.bmiresult, @required this.resultText,
      @required this.interpretation);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Your Result',
              textAlign: TextAlign.center,
              style: kYourResultTextStyle,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: kActiveCardColor,
                ),
                margin: EdgeInsets.all(15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      resultText,
                      style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF24D876)),
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    Text(
                      bmiresult,
                      style: kNumberTextStyle,
                    ),
                    Text(
                      interpretation,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 25.0),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                height: 60,
                color: kBottomContainerColor,
                child: Center(
                  child: Text(
                    'RECALCULATE',
                    style:
                        TextStyle(fontSize: 30.0, fontWeight: FontWeight.w900),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

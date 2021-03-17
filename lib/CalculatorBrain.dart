import 'dart:math';

class CalculatorBrain {
  final int height;
  final int weight;
  double _bmi;
  CalculatorBrain(this.height, this.weight);
  String bmicalculator() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'OVERWEIGHT';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'underWeight';
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return 'you are Overweight';
    } else if (_bmi >= 18.5) {
      return 'you have a perfect body';
    } else {
      return 'you are underweight';
    }
  }
}

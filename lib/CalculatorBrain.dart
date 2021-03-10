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
      return 'Bhai mota ho gya h tu jaldi ptla ho ja nhi to shadi k lalle pd jayenge';
    } else if (_bmi >= 18.5) {
      return 'Bawa bole to ek dum kantap bady he bss ese hi maintain krke rkh';
    } else {
      return 'bhai khaya peeya krr nhi to log kuposhit bolna chalu karr denge';
    }
  }
}

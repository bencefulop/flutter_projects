import 'dart:math';

class CalculatorBrain {
  CalculatorBrain({this.height, this.weight});

  final int height;
  final int weight;

  double _bmi;

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      print('Overweight interpretation Lorem Ipsum Dolor sit');
      return 'Overweight interpretation Lorem Ipsum Dolor sit';
    } else if (_bmi > 18.5) {
      print('Normal interpretation Lorem Ipsum Dolor sit');
      return 'Normal interpretation Lorem Ipsum Dolor sit';
    } else {
      print('Underweight interpretation Lorem Ipsum Dolor sit');
      return 'Underweight interpretation Lorem Ipsum Dolor sit';
    }
  }
}

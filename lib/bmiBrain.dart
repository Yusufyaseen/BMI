import 'dart:math';

class CalculateBmi {
  CalculateBmi({this.height, this.weight});
  final int height;
  final int weight;
  double _bmi;
  String calculateBmi() {
    _bmi = (this.weight / (pow(this.height / 100, 2)));
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 30)
      return 'Obesity';
    else if (_bmi >= 25)
      return 'Overweight';
    else if (_bmi > 18.5)
      return 'Normal';
    else
      return 'Underweight';
  }

  String getInterpretation() {
    if (_bmi >= 30)
      return 'You have an obesity body, You have to exercise more and more';
    else if (_bmi >= 25)
      return 'You have a higher than normal body weight, Try to exercise more';
    else if (_bmi > 18.5)
      return 'You have a normal body weight, That is a good job';
    else
      return 'You have a higher than normal body, try to exercise more';
  }
}

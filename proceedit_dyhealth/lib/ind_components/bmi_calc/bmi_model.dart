import 'dart:math';
import 'package:flutter/cupertino.dart';

class BMICalculator {
  BMICalculator({this.height, this.weight});

  final int height;
  final int weight;
  double _bmi;

  String getBMIValue({bool pounds = false}) {
    if (pounds == true) {
      _bmi = 703 * weight / pow(0.3937 * height, 2); // CM to INCH conversion
      return _bmi.toStringAsFixed(1);
    } else {
      _bmi = weight / pow(height / 100, 2);
      return _bmi.toStringAsFixed(1);
    }
  }

  String getBMITextResult() {
    if (_bmi >= 30) {
      return ' obese ';
    } else if (_bmi >= 25 && _bmi < 30) {
      return 'Over Weight';
    } else if (_bmi > 18.5 && _bmi < 25) {
      return 'Normal';
    } else {
      return 'Under Weight';
    }
  }

  Image getImage() {
    if (_bmi >= 30) {
      return Image.asset('lib/ind_components/bmi_calc/images/obese.png', fit: BoxFit.contain);
    } else if (_bmi >= 25 && _bmi < 30) {
      return Image.asset('lib/ind_components/bmi_calc/images/overweight.png', fit: BoxFit.contain);
    } else if (_bmi > 18.5 && _bmi < 25) {
      return Image.asset('lib/ind_components/bmi_calc/images/normal.png', fit: BoxFit.contain);
    } else {
      return Image.asset('lib/ind_components/bmi_calc/images/underweight.png', fit: BoxFit.contain);
    }
  }

  String getBMIInterpretation() {
    if (_bmi >= 30) {
      return 'You are obese, Eat healthy and Exercise More !';
    } else if (_bmi >= 25 && _bmi < 30) {
      return 'You are over weight, Try to Exercise for Better Health !';
    } else if (_bmi > 18.5 && _bmi < 25) {
      return 'Good Job, You have a Normal body weight, Exercise to stay Fit !';
    } else {
      return 'You are Under Weight, Eat more and add calories to your Diet ! ';
    }
  }
}

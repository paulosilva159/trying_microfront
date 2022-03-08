import 'package:microfront_basic_calculator/src/models/calculation.dart';

class Result {
  const Result({this.calculation = const Calculation(), this.value});

  final Calculation calculation;
  final String? value;
}

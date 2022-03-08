import 'package:trying_microfront/basic_calculator/models/calculation.dart';

class Result {
  const Result({this.calculation = const Calculation(), this.value});

  final Calculation calculation;
  final String? value;
}

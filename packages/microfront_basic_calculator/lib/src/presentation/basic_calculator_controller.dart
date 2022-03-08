import 'dart:async';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:microfront_basic_calculator/src/models/calculation.dart';
import 'package:microfront_basic_calculator/src/models/cell_type.dart';
import 'package:microfront_basic_calculator/src/models/result.dart';

class BasicCalculatorController {
  BasicCalculatorController() {
    _controller.stream.listen((event) {
      final result = _resultNotifier.value;
      final calculation = _resultNotifier.value.calculation;

      if (event != null) {
        if (result.value != null && event.type == CellType.operation) {
          final newCalculation = Calculation(
            firstValue: int.parse(result.value!),
            operation: event.value,
          );

          _resultNotifier.value = Result(calculation: newCalculation);
        } else {
          switch (event.type) {
            case CellType.number:
              if (calculation.operation != null) {
                final newCalculation = Calculation(
                  firstValue: calculation.firstValue,
                  operation: calculation.operation,
                  secondValue: int.parse(event.value),
                );

                _resultNotifier.value = Result(calculation: newCalculation);
              } else {
                final newCalculation = Calculation(
                  firstValue: int.parse(event.value),
                );

                _resultNotifier.value = Result(calculation: newCalculation);
              }
              break;
            case CellType.operation:
              if (calculation.firstValue != null) {
                final newCalculation = Calculation(
                  firstValue: calculation.firstValue,
                  operation: event.value,
                );

                _resultNotifier.value = Result(calculation: newCalculation);
              }
              break;
            case CellType.result:
              String? newValue;

              if (calculation.isReady) {
                switch (calculation.operation) {
                  case '+':
                    newValue =
                        '${calculation.firstValue! + calculation.secondValue!}';
                    break;
                  case '-':
                    newValue =
                        '${calculation.firstValue! - calculation.secondValue!}';
                    break;
                  case '*':
                    newValue =
                        '${calculation.firstValue! * calculation.secondValue!}';
                    break;
                  case '^':
                    newValue =
                        '${pow(calculation.firstValue!, calculation.secondValue!)}';
                    break;
                }

                _resultNotifier.value = Result(value: newValue);
              }
              break;
            case CellType.none:
              break;
          }
        }
      }
    });

    _resultNotifier.addListener(() {
      _resultEmitter.sink.add(_resultNotifier.value);
    });
  }

  final _controller = StreamController<BasicCalculatorEvent?>();
  final _resultEmitter = StreamController<Result>();

  final _resultNotifier = ValueNotifier<Result>(const Result());

  void write(BasicCalculatorEvent event) => _controller.sink.add(event);
  Stream<Result> get result => _resultEmitter.stream;
}

class BasicCalculatorEvent {
  const BasicCalculatorEvent({
    required this.type,
    required this.value,
  });

  final CellType type;
  final String value;
}

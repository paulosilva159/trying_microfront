import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:microfront_basic_calculator/microfront_basic_calculator.dart';
import 'package:microfront_monitor/microfront_monitor.dart';
import 'package:trying_microfront/core/mapper/result_to_presentation.dart';

class Communication {
  Communication._({
    required this.monitorController,
    required this.basicCalculatorController,
  }) {
    _calculatorToMonitor = StreamController<Presentation>();

    basicCalculatorController.result.listen((result) {
      _calculatorToMonitor.sink.add(result.convert());
    });

    _calculatorToMonitor.stream.listen(monitorController.write);
  }

  factory Communication.start() => Communication._(
        monitorController: GetIt.I.get<MonitorController>(),
        basicCalculatorController: GetIt.I.get<BasicCalculatorController>(),
      );

  final MonitorController monitorController;
  final BasicCalculatorController basicCalculatorController;
  late final StreamController<Presentation> _calculatorToMonitor;
}

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:trying_microfront/basic_calculator/basic_calculator_controller.dart';
import 'package:trying_microfront/basic_calculator/basic_calculator_view.dart';
import 'package:trying_microfront/basic_calculator/basic_calculator_injection.dart';
import 'package:trying_microfront/monitor/models/presentation.dart';
import 'package:trying_microfront/monitor/monitor_controller.dart';
import 'package:trying_microfront/monitor/monitor_injection.dart';
import 'package:trying_microfront/monitor/monitor_view.dart';

void main() {
  injectBasicCalculatorDependencies();
  injectMonitorDependencies();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final MonitorController monitorController;
  late final BasicCalculatorController basicCalculatorController;

  @override
  void initState() {
    basicCalculatorController = GetIt.I.get<BasicCalculatorController>();
    monitorController = GetIt.I.get<MonitorController>();

    basicCalculatorController.result.listen((event) {
      if (event.value != null) {
        monitorController.write(
          Presentation(value: event.value!),
        );
      } else if (!event.calculation.isEmpty) {
        final value = event.calculation;
        final show =
            '${value.firstValue}${value.operation != null ? ' ${value.operation} ' : ''}${value.secondValue ?? ''}';

        monitorController.write(
          Presentation(value: show),
        );
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Column(
        children: const [
          Expanded(
            child: MonitorView(),
          ),
          BasicCalculatorView(),
        ],
      ),
    );
  }
}

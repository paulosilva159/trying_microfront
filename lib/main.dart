import 'package:flutter/material.dart';
import 'package:microfront_basic_calculator/microfront_basic_calculator.dart';
import 'package:microfront_monitor/microfront_monitor.dart';
import 'package:trying_microfront/core/dependencies/injection.dart';

void main() {
  initializeDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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

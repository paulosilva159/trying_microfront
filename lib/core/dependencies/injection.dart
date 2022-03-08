import 'package:microfront_basic_calculator/microfront_basic_calculator.dart';
import 'package:microfront_monitor/microfront_monitor.dart';
import 'package:trying_microfront/core/communication/communication.dart';

void initializeDependencies() {
  injectBasicCalculatorDependencies();
  injectMonitorDependencies();

  Communication.start();
}

import 'package:get_it/get_it.dart';
import 'package:trying_microfront/monitor/monitor_controller.dart';

void injectMonitorDependencies() {
  GetIt.I.registerLazySingleton(() => MonitorController());
}

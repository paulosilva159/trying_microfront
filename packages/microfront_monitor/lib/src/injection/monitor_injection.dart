import 'package:get_it/get_it.dart';
import 'package:microfront_monitor/src/presentation/monitor_controller.dart';

void injectMonitorDependencies() {
  GetIt.I.registerLazySingleton(() => MonitorController());
}

import 'package:get_it/get_it.dart';
import 'package:microfront_basic_calculator/src/presentation/basic_calculator_controller.dart';

void injectBasicCalculatorDependencies() {
  GetIt.I.registerLazySingleton(() => BasicCalculatorController());
}

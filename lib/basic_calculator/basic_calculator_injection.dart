import 'package:get_it/get_it.dart';
import 'package:trying_microfront/basic_calculator/basic_calculator_controller.dart';

void injectBasicCalculatorDependencies() {
  GetIt.I.registerLazySingleton(() => BasicCalculatorController());
}

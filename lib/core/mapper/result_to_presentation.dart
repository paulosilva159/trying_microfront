import 'package:microfront_basic_calculator/microfront_basic_calculator.dart';
import 'package:microfront_monitor/microfront_monitor.dart';

extension BasicResultToPresentation on Result {
  Presentation convert() {
    if (!calculation.isEmpty) {
      final converted =
          '${calculation.firstValue}${calculation.operation != null ? ' ${calculation.operation} ' : ''}${calculation.secondValue ?? ''}';

      return Presentation(value: converted);
    } else {
      return Presentation(value: value ?? '');
    }
  }
}

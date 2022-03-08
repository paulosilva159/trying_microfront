import 'dart:async';

import 'package:microfront_monitor/src/models/presentation.dart';

class MonitorController {
  final _controller = StreamController<Presentation>();

  void write(Presentation event) => _controller.sink.add(event);
  Stream<Presentation> get value => _controller.stream;
}

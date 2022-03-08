import 'dart:async';

import 'package:trying_microfront/monitor/models/presentation.dart';

class MonitorController {
  final _controller = StreamController<Presentation>();

  void write(Presentation event) => _controller.sink.add(event);
  Stream<Presentation> get value => _controller.stream;
}

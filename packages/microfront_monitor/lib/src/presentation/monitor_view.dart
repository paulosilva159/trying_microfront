import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:microfront_monitor/src/models/presentation.dart';
import 'package:microfront_monitor/src/presentation/monitor_controller.dart';

class MonitorView extends StatefulWidget {
  const MonitorView({Key? key}) : super(key: key);

  @override
  State<MonitorView> createState() => _MonitorViewState();
}

class _MonitorViewState extends State<MonitorView> {
  late final MonitorController controller;

  @override
  void initState() {
    super.initState();
    controller = GetIt.I.get<MonitorController>();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Colors.grey,
        child: StreamBuilder<Presentation>(
            initialData: Presentation(value: 'Aguardando valor'),
            stream: controller.value,
            builder: (context, snapshot) {
              final data = snapshot.data!;

              return Center(
                child: Text(
                  data.value,
                  style: Theme.of(context)
                      .textTheme
                      .headline2
                      ?.copyWith(color: Colors.black),
                ),
              );
            }),
      ),
    );
  }
}

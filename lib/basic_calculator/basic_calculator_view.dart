import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:trying_microfront/basic_calculator/basic_calculator_controller.dart';
import 'package:trying_microfront/basic_calculator/models/cell_type.dart';

class BasicCalculatorView extends StatelessWidget {
  const BasicCalculatorView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.orange,
      child: Table(
        border: TableBorder.all(
          color: Colors.black,
          width: 4,
        ),
        children: const [
          TableRow(
            children: <Widget>[
              CalculatorButton(
                text: '1',
                type: CellType.number,
              ),
              CalculatorButton(
                text: '2',
                type: CellType.number,
              ),
              CalculatorButton(
                text: '3',
                type: CellType.number,
              ),
              CalculatorButton(
                text: '-',
                type: CellType.operation,
              ),
            ],
          ),
          TableRow(children: <Widget>[
            CalculatorButton(
              text: '4',
              type: CellType.number,
            ),
            CalculatorButton(
              text: '5',
              type: CellType.number,
            ),
            CalculatorButton(
              text: '6',
              type: CellType.number,
            ),
            CalculatorButton(
              text: '+',
              type: CellType.operation,
            ),
          ]),
          TableRow(children: <Widget>[
            CalculatorButton(
              text: '7',
              type: CellType.number,
            ),
            CalculatorButton(
              text: '8',
              type: CellType.number,
            ),
            CalculatorButton(
              text: '9',
              type: CellType.number,
            ),
            CalculatorButton(
              text: '*',
              type: CellType.operation,
            ),
          ]),
          TableRow(children: <Widget>[
            CalculatorButton(
              text: ':0',
            ),
            CalculatorButton(
              text: '0',
              type: CellType.number,
            ),
            CalculatorButton(
              text: '=',
              type: CellType.result,
            ),
            CalculatorButton(
              text: '^',
              type: CellType.operation,
            ),
          ]),
        ],
      ),
    );
  }
}

class CalculatorButton extends StatefulWidget {
  const CalculatorButton({
    Key? key,
    this.type = CellType.none,
    required this.text,
  }) : super(key: key);

  final CellType type;
  final String text;

  @override
  State<CalculatorButton> createState() => _CalculatorButtonState();
}

class _CalculatorButtonState extends State<CalculatorButton> {
  late final BasicCalculatorController controller;

  @override
  void initState() {
    super.initState();
    controller = GetIt.I.get<BasicCalculatorController>();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.type == CellType.none
          ? null
          : () {
              controller.write(
                BasicCalculatorEvent(
                  type: widget.type,
                  value: widget.text,
                ),
              );
            },
      child: Center(
        child: Text(
          widget.text,
          style: Theme.of(context)
              .textTheme
              .headline2
              ?.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}

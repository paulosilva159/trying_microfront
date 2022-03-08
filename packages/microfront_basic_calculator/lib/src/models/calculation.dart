class Calculation {
  const Calculation({
    this.firstValue,
    this.operation,
    this.secondValue,
  });

  final int? firstValue;
  final String? operation;
  final int? secondValue;

  bool get isReady =>
      firstValue != null && operation != null && secondValue != null;
  bool get isEmpty =>
      firstValue == null && operation == null && secondValue == null;
}

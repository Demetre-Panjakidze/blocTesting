part of 'counter_cubit.dart';

class CounterState {
  final int counterValue;
  final bool? wasIncremented;

  const CounterState({
    required this.counterValue,
    this.wasIncremented,
  });
}

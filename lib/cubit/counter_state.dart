part of 'counter_cubit.dart';

class CounterState {
  int counterValue;
  bool? wasIncremented;
  CounterState({
    this.wasIncremented,
    required this.counterValue,
  });
}

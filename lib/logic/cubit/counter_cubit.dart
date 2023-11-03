import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloctesting/constants/enums.dart';
import 'package:bloctesting/logic/cubit/internet_cubit.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  final InternetCubit internetCubit;
  late StreamSubscription internetStreamSubscription;

  CounterCubit({required this.internetCubit})
      : super(const CounterState(counterValue: 0)) {
    monitorInternetCubit();
  }

  StreamSubscription<InternetState> monitorInternetCubit() {
    return internetStreamSubscription = internetCubit.stream.listen(
      (internetState) {
        if (internetState is InternetConnected &&
            internetState.connectionType == ConnectionType.Wifi) {
          increment();
        } else if (internetState is InternetConnected &&
            internetState.connectionType == ConnectionType.Mobile) {
          decrement();
        }
      },
    );
  }

  void increment() => emit(
      CounterState(counterValue: state.counterValue + 1, wasIncremented: true));

  void decrement() => emit(CounterState(
      counterValue: state.counterValue - 1, wasIncremented: false));

  @override
  Future<void> close() {
    internetStreamSubscription.cancel();
    return super.close();
  }
}

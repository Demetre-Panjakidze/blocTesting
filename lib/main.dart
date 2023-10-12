import 'package:bloc/bloc.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

  void increment() => emit(state + 1);

  void decrement() => emit(state - 1);
}

// void main() {
//   final cubit = CounterCubit();
//   print(cubit.state); //0
//   cubit.increment();
//   print(cubit.state); //1
//   cubit.increment();
//   print(cubit.state); //2
//   cubit.close();
// }

Future<void> main() async {
  final cubit = CounterCubit();
  print(cubit.state);
  final subscription = cubit.stream.listen(
    (event) {
      print(event);
    },
  );
  cubit.increment();
  await Future.delayed(Duration.zero);
  await subscription.cancel();
  await cubit.close();
}

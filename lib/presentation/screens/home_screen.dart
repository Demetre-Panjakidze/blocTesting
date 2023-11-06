import 'package:bloctesting/constants/enums.dart';
import 'package:bloctesting/logic/cubit/counter_cubit.dart';
import 'package:bloctesting/logic/cubit/internet_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, this.title, this.color});

  final String? title;
  final Color? color;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title!),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
              style: TextStyle(fontSize: 20),
            ),
            BlocConsumer<CounterCubit, CounterState>(
              listener: (context, state) {
                ScaffoldMessenger.of(context).clearSnackBars();
                ScaffoldMessenger.of(context).showSnackBar(
                  state.wasIncremented == true
                      ? const SnackBar(
                          content: Text("Incremented"),
                          duration: Duration(seconds: 2),
                        )
                      : const SnackBar(
                          content: Text("Decremented"),
                          duration: Duration(seconds: 2),
                        ),
                );
              },
              builder: (context, state) {
                return Text(
                  state.counterValue.toString(),
                  style: const TextStyle(fontSize: 30),
                );
              },
            ),
            const Gap(24),
            Builder(
              builder: (context) {
                final counterState = context.watch<CounterCubit>().state;
                final internetState = context.watch<InternetCubit>().state;

                if (internetState is InternetConnected &&
                    internetState.connectionType == ConnectionType.Mobile) {
                  return Text(
                      'Counter: ${counterState.counterValue.toString()}, Internet: Mobile');
                } else if (internetState is InternetConnected &&
                    internetState.connectionType == ConnectionType.Wifi) {
                  return Text(
                      'Counter: ${counterState.counterValue.toString()}, Internet: Wifi');
                } else {
                  return Text(
                      'Counter: ${counterState.counterValue.toString()}, Internet: Disconnected');
                }
              },
            ),
            const Gap(24),
            Builder(
              builder: (context) {
                final counterValue = context.select(
                  (CounterCubit cubit) => cubit.state.counterValue,
                );

                return Text('Counter: ${counterValue.toString()}');
              },
            ),
            const Gap(24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).decrement();
                  },
                  tooltip: 'Decrement',
                  child: const Icon(Icons.remove),
                ),
                FloatingActionButton(
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).increment();
                  },
                  tooltip: 'Increment',
                  child: const Icon(Icons.add),
                ),
              ],
            ),
            const Gap(24),
            MaterialButton(
              color: widget.color,
              onPressed: () {
                Navigator.of(context).pushNamed('/second');
              },
              child: const Text(
                'Second screen',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            const Gap(24),
            MaterialButton(
              color: widget.color,
              onPressed: () {
                Navigator.of(context).pushNamed('/third');
              },
              child: const Text(
                'Third screen',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

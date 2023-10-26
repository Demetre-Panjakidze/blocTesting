import 'package:bloctesting/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/counter_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterCubit(),
      child: const MaterialApp(
        home: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Counter App")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "Number you got from pressing the button:",
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(height: 20),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton(
                onPressed: () {
                  BlocProvider.of<CounterCubit>(context).decrement();
                },
                tooltip: "decrement",
                child: const Icon(Icons.remove),
              ),
              const SizedBox(width: 10),
              BlocConsumer<CounterCubit, CounterState>(
                builder: (context, state) {
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                    child: Text(
                      state.counterValue.toString(),
                      style: const TextStyle(fontSize: 20),
                    ),
                  );
                },
                listener: (context, state) {
                  ScaffoldMessenger.of(context).clearSnackBars();
                  ScaffoldMessenger.of(context).showSnackBar(
                    state.wasIncremented == true
                        ? const SnackBar(
                            content: Text("incremented"),
                            duration: Duration(seconds: 2),
                          )
                        : const SnackBar(
                            content: Text("decremented"),
                            duration: Duration(seconds: 2),
                          ),
                  );
                },
              ),
              const SizedBox(width: 10),
              FloatingActionButton(
                onPressed: () {
                  BlocProvider.of<CounterCubit>(context).increment();
                },
                tooltip: "increment",
                child: const Icon(Icons.add),
              ),
            ],
          )
        ],
      ),
    );
  }
}

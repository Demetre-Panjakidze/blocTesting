import 'package:bloctesting/logic/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key, this.title, this.color});

  final String? title;
  final Color? color;

  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
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
            )
          ],
        ),
      ),
    );
  }
}

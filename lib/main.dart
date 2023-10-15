import 'package:bloctesting/counter_bloc.dart';
import 'package:bloctesting/counter_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const CounterApp());
}

class CounterApp extends StatelessWidget {
  const CounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (_) => CounterBloc(),
        child: CounterPage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Text('random'),
    );
  }
}

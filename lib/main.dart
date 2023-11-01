import 'package:bloctesting/presentation/router/app_router.dart';
import 'package:bloctesting/presentation/screens/home_screen.dart';
import 'package:bloctesting/presentation/screens/second_screen.dart';
import 'package:bloctesting/presentation/screens/third_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'logic/cubit/counter_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      onGenerateRoute: _appRouter.onGenerateRoute,
    );
  }

  @override
  void dispose() {
    _appRouter.dispose();
    super.dispose();
  }
}

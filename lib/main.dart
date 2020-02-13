import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:renote/di/renote_bloc_provider.dart';
import 'package:renote/error/error_reporting_bloc_delegate.dart';

import 'home/home.dart';

void main() {
  BlocSupervisor.delegate = ErrorReportingBlocDelegate();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RenoteBlocProvider(child: Home()),
    );
  }
}

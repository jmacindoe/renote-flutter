import 'package:flutter/material.dart';
import 'package:renote/di/renote_bloc_provider.dart';

import 'home/home.dart';

void main() => runApp(MyApp());

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

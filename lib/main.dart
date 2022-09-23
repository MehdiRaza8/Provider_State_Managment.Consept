import 'package:flutter/material.dart';
import 'package:managestate/provider/count.dart';
import 'package:managestate/screen/count_example.dart';
import 'package:managestate/screen/multi_example.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CountProvider(),
      child: MaterialApp(
        home: ExampleOne(),
      ),
    );
  }
}

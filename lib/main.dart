import 'package:flutter/material.dart';
import 'package:managestate/favourite/fovourite_screen.dart';
import 'package:managestate/provider/count.dart';
import 'package:managestate/provider/favourite_provider.dart';
import 'package:managestate/provider/multi_provider_example.dart';
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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CountProvider()),
        ChangeNotifierProvider(create: (_) => ExampleOneProvider()),
        ChangeNotifierProvider(create: (_) => FavouriteItem()),
      ],
      child: MaterialApp(
        home: FavouriteScreen(),
      ),
    );
  }
}

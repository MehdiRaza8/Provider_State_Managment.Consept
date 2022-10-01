import 'package:flutter/material.dart';
import 'package:managestate/provider/auth_provider.dart';

import 'package:managestate/provider/count.dart';
import 'package:managestate/provider/dark_them_provider.dart';
import 'package:managestate/provider/favourite_provider.dart';
import 'package:managestate/provider/multi_provider_example.dart';
import 'package:managestate/screen/dark_them.dart';
import 'package:managestate/screen/login.dart';
import 'package:managestate/screen/value_notify_lisner.dart';
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
          ChangeNotifierProvider(create: (_) => ThemChanger()),
          ChangeNotifierProvider(create: (_) => Authentication()),
        ],
        child: Builder(
          builder: (BuildContext context) {
            final themchanger = Provider.of<ThemChanger>(context);
            return MaterialApp(
              themeMode: themchanger.themMode,
              theme: ThemeData(
                  brightness: Brightness.light,
                  appBarTheme: AppBarTheme(color: Colors.teal),
                  iconTheme: IconThemeData(color: Colors.teal)),
              darkTheme: ThemeData(
                  brightness: Brightness.dark,
                  appBarTheme: AppBarTheme(color: Colors.yellow),
                  iconTheme: const IconThemeData(color: Colors.red)),
              home: LoginScreen(),
            );
          },
        ));
  }
}

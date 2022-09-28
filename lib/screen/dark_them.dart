import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/dark_them_provider.dart';

class DarkThemScreen extends StatefulWidget {
  const DarkThemScreen({super.key});

  @override
  State<DarkThemScreen> createState() => _DarkThemScreenState();
}

class _DarkThemScreenState extends State<DarkThemScreen> {
  @override
  Widget build(BuildContext context) {
    final themchanger = Provider.of<ThemChanger>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyApp'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          RadioListTile<ThemeMode>(
            title: const Text('Light Them'),
            value: ThemeMode.light,
            groupValue: themchanger.themMode,
            onChanged: themchanger.setThem,
          ),
          RadioListTile<ThemeMode>(
            title: const Text('Dark Them'),
            value: ThemeMode.dark,
            groupValue: themchanger.themMode,
            onChanged: themchanger.setThem,
          ),
          RadioListTile<ThemeMode>(
            title: const Text('System default'),
            value: ThemeMode.system,
            groupValue: themchanger.themMode,
            onChanged: themchanger.setThem,
          ),
          Icon(
            Icons.favorite,
          )
        ],
      ),
    );
  }
}

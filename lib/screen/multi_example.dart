import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:managestate/provider/multi_provider_example.dart';
import 'package:provider/provider.dart';

class ExampleOne extends StatefulWidget {
  const ExampleOne({super.key});

  @override
  State<ExampleOne> createState() => _ExampleOneState();
}

class _ExampleOneState extends State<ExampleOne> {
  double _currentValue = 1.0;
  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      appBar: AppBar(
        title: Text('MyApp'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Consumer<ExampleOneProvider>(builder: ((context, value, child) {
            return Slider(
                min: 0,
                max: 1,
                activeColor: Colors.red,
                inactiveColor: Colors.blueGrey,
                autofocus: true,
                divisions: 15,
                value: value.currentValue,
                onChanged: (val) {
                  value.setValue(val);
                });
          })),
          Consumer<ExampleOneProvider>(builder: ((context, value, child) {
            return Row(
              children: [
                Expanded(
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                        color: Colors.green.withOpacity(value.currentValue)),
                    child: Text('Container 1'),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                        color: Colors.red.withOpacity(value.currentValue)),
                    child: Text('Container 1'),
                  ),
                ),
              ],
            );
          })),
        ],
      ),
    );
  }
}

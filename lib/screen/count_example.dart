import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:managestate/provider/count.dart';
import 'package:provider/provider.dart';

class CountExample extends StatefulWidget {
  const CountExample({super.key});

  @override
  State<CountExample> createState() => _CountExampleState();
}

class _CountExampleState extends State<CountExample> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final countProvider = Provider.of<CountProvider>(context, listen: false);
    Timer.periodic(Duration(seconds: 1), (timer) {
      countProvider.setCounter();
    });
  }

  @override
  Widget build(BuildContext context) {
    final countProvider = Provider.of<CountProvider>(context, listen: false);
    print('build');
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter'),
        centerTitle: true,
      ),
      body: Center(child: Consumer<CountProvider>(
        builder: (context, value, child) {
          return Text(value.count.toString(),
              style: TextStyle(
                fontSize: 40,
              ));
        },
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: (() {
          countProvider.setCounter();
        }),
        child: Icon(Icons.add),
      ),
    );
  }
}

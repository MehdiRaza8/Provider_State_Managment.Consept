import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ExampleOne extends StatefulWidget {
  const ExampleOne({super.key});

  @override
  State<ExampleOne> createState() => _ExampleOneState();
}

class _ExampleOneState extends State<ExampleOne> {
  @override
  Widget build(BuildContext context) {
    double value = 1.0;
    return Scaffold(
      appBar: AppBar(
        title: Text('MyApp'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Slider(
              min: 0,
              max: 1,
              value: value,
              onChanged: (val) {
                value = val;
                print(value);

                setState(() {});
              }),
          Row(
            children: [
              Expanded(
                child: Container(
                  decoration:
                      BoxDecoration(color: Colors.green.withOpacity(value)),
                  height: 100,
                  child: Text('container 1'),
                ),
              ),
              Expanded(
                child: Container(
                  decoration:
                      BoxDecoration(color: Colors.red.withOpacity(value)),
                  height: 100,
                  child: Text('container 1'),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

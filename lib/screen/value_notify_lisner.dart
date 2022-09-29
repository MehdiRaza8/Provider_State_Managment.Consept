import 'package:flutter/material.dart';

class NotifyinglisnerScreen extends StatelessWidget {
  NotifyinglisnerScreen({super.key});
  ValueNotifier<int> _count = ValueNotifier<int>(0);
  ValueNotifier<bool> toggle = ValueNotifier<bool>(true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MyApp'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
              padding: EdgeInsets.all(15),
              child: ValueListenableBuilder(
                  valueListenable: toggle,
                  builder: (context, value, child) {
                    return TextFormField(
                      obscureText: toggle.value,
                      decoration: InputDecoration(
                        focusColor: Colors.grey,
                        hintText: 'passworf',
                        suffix: InkWell(
                            onTap: () {
                              toggle.value = !toggle.value;
                            },
                            child: Icon(toggle.value
                                ? Icons.visibility_off_outlined
                                : (Icons.visibility))),
                      ),
                    );
                  })),
          Center(
              child: ValueListenableBuilder(
                  valueListenable: _count,
                  builder: (context, value, child) {
                    return Text(
                      _count.value.toString(),
                      style: TextStyle(fontSize: 50),
                    );
                  })),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _count.value++;
          print(_count.value.toString());
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

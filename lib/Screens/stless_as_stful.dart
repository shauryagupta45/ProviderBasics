import 'package:flutter/material.dart';

class NotifyListenerScreen extends StatelessWidget {
  NotifyListenerScreen({Key? key}) : super(key: key);

  ValueNotifier<int> _counter = ValueNotifier<int>(0);
  ValueNotifier<bool> _toggle = ValueNotifier<bool>(true);

  // disadvantage of all this is, we can't dispose these notifiers
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Statless as Stateful"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          ValueListenableBuilder(
              valueListenable: _toggle,
              builder: (context, value, child) {
                return TextFormField(
                  obscureText: _toggle.value,
                  decoration: InputDecoration(
                    suffix: InkWell(
                      child: Icon(
                        _toggle.value ? Icons.visibility_off : Icons.visibility,
                      ),
                      onTap: () {
                        _toggle.value = !_toggle.value;
                      },
                    ),
                  ),
                );
              }),
          Center(
              child: ValueListenableBuilder(
                  valueListenable: _counter,
                  builder: (context, value, child) {
                    return Text(
                      _counter.value.toString(),
                      style: const TextStyle(fontSize: 50),
                    );
                  })),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _counter.value++;
          print(_counter.value.toString());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

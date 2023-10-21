import 'package:flutter/material.dart';

class NotifyListenerScreen extends StatelessWidget {
  const NotifyListenerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Statless as Stateful"),
        centerTitle: true,
      ),
      body: Center(
        child: Text(" Counter Screen "),
      ),
      floatingActionButton: FloatingActionButton(onPressed: onPressed),
    );
  }
}

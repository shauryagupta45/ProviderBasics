import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_basic/Provider/count_provider.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({Key? key}) : super(key: key);

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final countProvider = Provider.of<CountProvider>(context, listen: false);
    Timer.periodic(const Duration(seconds: 2), (timer) {
      countProvider.setCount();
    });
  } // Now since init is initialized before the main build, now this will work as the main provider, not the one after widget build, hence, count value will get updated every 2seconds now automatically instead of tapping on floating action button

  @override
  Widget build(BuildContext context) {
    final countProvider = Provider.of<CountProvider>(context,
        listen:
            false); // falsifying the listen option stops the whole build to get built again and again
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Counter Provider"),
      ),
      body: Center(
        child: Consumer<CountProvider>(builder: (context, value, child) {
          // before using Consumer , it was building the whole build widget again and again, consumer is what does the magic and is responsible for building only the corresponding widget
          print("Updated value");
          return Text(
            value.count.toString(),
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 50.0),
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          countProvider.setCount();
          //for increasing the counter
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

//This portrays the implementation of multi provider feature

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_basic/Provider/sliderScreenProvider.dart';

class SliderScreen extends StatefulWidget {
  const SliderScreen({Key? key}) : super(key: key);

  @override
  State<SliderScreen> createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SliderProvider>(context, listen: false);
    print("build");
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Slider Screen"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<SliderProvider>(builder: (context, value, child) {
            print("Slide");
            return Slider(
              min: 0,
              max: 1,
              value: value.value,
              onChanged: (val) {
                provider.setValue(val);
              },
            );
          }),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Consumer<SliderProvider>(builder: (context, value, child) {
              return Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 100.0,
                      decoration: BoxDecoration(
                        color: Colors.green.withOpacity(value.value),
                      ),
                      child: const Center(
                        child: Text("Container 1"),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 100.0,
                      decoration: BoxDecoration(
                        color: Colors.red.withOpacity(value.value),
                      ),
                      child: const Center(
                        child: Text("Container 2"),
                      ),
                    ),
                  ),
                ],
              );
            }),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_basic/Provider/count_provider.dart';
import 'package:provider_basic/Provider/sliderScreenProvider.dart';
import 'package:provider_basic/Screens/count_screen.dart';
import 'package:provider_basic/Screens/sliderScreen.dart';

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
          ChangeNotifierProvider(create: (_) => SliderProvider())
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const CounterScreen(),
        ));
  }
}

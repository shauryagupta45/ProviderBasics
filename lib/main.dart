import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_basic/Provider/auth_provider.dart';
import 'package:provider_basic/Provider/count_provider.dart';
import 'package:provider_basic/Provider/favorite_item_provider.dart';
import 'package:provider_basic/Provider/sliderScreenProvider.dart';
import 'package:provider_basic/Provider/theme_provider.dart';
import 'package:provider_basic/Screens/count_screen.dart';
import 'package:provider_basic/Screens/favorite_screen.dart';
import 'package:provider_basic/Screens/sliderScreen.dart';
import 'package:provider_basic/Screens/theme_changer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    print("Build");
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => CountProvider()),
          ChangeNotifierProvider(create: (_) => SliderProvider()),
          ChangeNotifierProvider(create: (_) => FavoriteItemProvider()),
          ChangeNotifierProvider(create: (_) => ThemeProvider()),
          ChangeNotifierProvider(create: (_) => AuthProvider()),
        ],
        child: Builder(builder: (BuildContext context) {
          final themeChanger =
              Provider.of<ThemeProvider>(context, listen: false);
          return Consumer<ThemeProvider>(builder: (context, value, child) {
            print("main provider");
            return MaterialApp(
              title: 'Flutter Demo',
              themeMode: value.themeMode,
              theme: ThemeData(
                brightness: Brightness.light,
                primarySwatch: Colors.red,
              ),
              darkTheme: ThemeData(
                brightness: Brightness.dark,
                primarySwatch: Colors.yellow,
                primaryColor: Colors.purpleAccent,
                // appBarTheme: AppBarTheme(backgroundColor: Colors.teal),
                iconTheme: const IconThemeData(color: Colors.pink),
              ),
              home: const ThemeScreen(),
            );
          });
        }));
  }
}

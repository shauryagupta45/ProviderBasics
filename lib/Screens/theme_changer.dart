import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_basic/Provider/theme_provider.dart';

class ThemeScreen extends StatefulWidget {
  const ThemeScreen({Key? key}) : super(key: key);

  @override
  State<ThemeScreen> createState() => _ThemeScreenState();
}

class _ThemeScreenState extends State<ThemeScreen> {
  @override
  Widget build(BuildContext context) {
    print("build1");
    final themeChanger = Provider.of<ThemeProvider>(context, listen: false);
    return Scaffold(
        appBar: AppBar(
          title: const Text("Theme Changer Screen"),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Consumer<ThemeProvider>(builder: (context, val, child) {
              print("screen provider");
              return Column(
                children: [
                  RadioListTile<ThemeMode>(
                      title: const Text("Light Mode"),
                      value: ThemeMode.light,
                      groupValue: val.themeMode,
                      onChanged: val
                          .setTheme), //inside themeChanger.setTheme we didn't pass the argument coz we already giving value ThemeMode.light above
                  RadioListTile<ThemeMode>(
                      title: const Text("Dark Mode"),
                      value: ThemeMode.dark,
                      groupValue: val.themeMode,
                      onChanged: val.setTheme),
                  const Icon(Icons.favorite),
                ],
              );
            })
          ],
        ));
  }
}

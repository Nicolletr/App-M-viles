import 'package:flutter/material.dart';
import 'screens/list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mail Box',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(255, 193, 81, 81),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color(0xff800000),
          secondary: const Color(0xffb71c1c),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const ListScreen(title: 'Mail Box: Nicole Triviño'),
    );
  }
}
// const ListScreen(title: 'Mail Box')
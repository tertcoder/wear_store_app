import 'package:flutter/material.dart';
import 'package:wear_store_app/screens/welcome.dart';

final theme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color.fromARGB(255, 251, 146, 60),
    brightness: Brightness.light,
  ),
  // textTheme: GoogleFonts.oswaldTextTheme(),
  fontFamily: 'Oswald',
);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      home: const WelcomeScreen(),
    );
  }
}

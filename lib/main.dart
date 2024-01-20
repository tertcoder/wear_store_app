import 'package:flutter/material.dart';
import 'package:wear_store_app/screens/home.dart';

final theme = ThemeData(
  // colorScheme: ColorScheme.fromSeed(
  //   seedColor: const Color.fromARGB(255, 251, 146, 60),
  //   brightness: Brightness.light,
  //   surface: const Color(0xFFFFF8F5),
  // ),
  colorScheme: const ColorScheme.light(
    onPrimaryContainer: Color(0xFF301400),
    outline: Color(0xFF84746A),
    primaryContainer: Color(0xFFFFDCC5),
    surfaceVariant: Color(0xFFF3DFD2),
    secondary: Color(0xFF755845),
    primary: Color(0xFF845022),
    surface: Color(0xFFFFF8F5),
    error: Color(0xFFBA1A1A),
    secondaryContainer: Color(0x00ffdcc5),
    onError: Color(0xFFFFFFFF),
    background: Color(0xFFFFF8F6),
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
      debugShowCheckedModeBanner: false,
      theme: theme,
      home: Home(),
    );
  }
}

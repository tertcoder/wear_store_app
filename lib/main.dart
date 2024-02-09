import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wear_store_app/screens/welcome.dart';

import 'package:wear_store_app/widgets/my_cart.dart';

final theme = ThemeData(
  colorScheme: const ColorScheme.light(
    onPrimaryContainer: Color(0xFF301400),
    outline: Color(0xFF84746A),
    primaryContainer: Color(0xFFFFDCC5),
    inversePrimary: Color(0xFFFFB783),
    surfaceVariant: Color(0xFFF3DFD2),
    secondary: Color(0xFF755845),
    primary: Color(0xFF845022),
    surface: Color(0xFFFFF8F5),
    error: Color(0xFFBA1A1A),
    secondaryContainer: Color(0xFFFFDCC5),
    onError: Color(0xFFFFFFFF),
    background: Color(0xFFFFF8F6),
  ),
  fontFamily: 'Oswald',
);

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
      // home: ShoeDetails(Shoe(
      //   brand: 'Nike',
      //   image: 'assets/images/shoes/image-1.webp',
      //   name: 'Shoes 01',
      //   price: 79.49,
      // )),
      home: const WelcomeScreen(),
    );
  }
}

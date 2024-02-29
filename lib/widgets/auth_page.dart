import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wear_store_app/screens/welcome.dart';
import 'package:wear_store_app/widgets/bottomNavBar/bottom_nav_bar.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // user is logged in
          if (snapshot.hasData) {
            return const BottomNavBar();
          } else {
            return const WelcomeScreen();
          }
        },
      ),
    );
  }
}

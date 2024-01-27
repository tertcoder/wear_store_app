import 'package:flutter/material.dart';
import 'package:wear_store_app/widgets/main_app_bar.dart';

class UserProfileScreen extends StatelessWidget {
  UserProfileScreen({super.key});

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orangeAccent,
      appBar: MainAppBar(
        scaffoldKey: _scaffoldKey,
        title: 'Profile',
      ),
    );
  }
}

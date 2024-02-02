import 'package:flutter/material.dart';

import 'package:wear_store_app/widgets/activity.dart';
import 'package:wear_store_app/widgets/main_app_bar.dart';
import 'package:wear_store_app/widgets/shadow_inverse.dart';
import 'package:wear_store_app/widgets/shoes_summary.dart';

class UserProfileScreen extends StatelessWidget {
  UserProfileScreen({super.key});

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        appBar: MainAppBar(
          scaffoldKey: _scaffoldKey,
          title: 'Profile',
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.center,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: SizedBox(
                  width: 150,
                  height: 150,
                  child: Image.asset('assets/images/user-profile.webp',
                      fit: BoxFit.cover),
                ),
              ),
            ),
            const SizedBox(
              height: 14,
            ),
            Text(
              "@tertcoder",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
                color: Theme.of(context).colorScheme.onPrimaryContainer,
              ),
            ),
            const SizedBox(
              height: 54,
            ),
            Expanded(
              child: ShadowInverse(
                borderRadius: BorderRadius.circular(15),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.fromLTRB(12, 28, 12, 20),
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surface,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      ),
                      border: Border.fromBorderSide(
                        BorderSide(
                          color: Theme.of(context).colorScheme.outline,
                        ),
                      )),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "You have",
                          style: TextStyle(
                              fontSize: 20,
                              color: Theme.of(context)
                                  .colorScheme
                                  .onPrimaryContainer),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        const Activity(),
                        const SizedBox(
                          height: 48,
                        ),
                        Text(
                          "Your Products",
                          style: TextStyle(
                              fontSize: 20,
                              color: Theme.of(context)
                                  .colorScheme
                                  .onPrimaryContainer),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        ShoesSummary(),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ));
  }
}

import 'package:flutter/material.dart';

class OurCollectionContainer extends StatelessWidget {
  const OurCollectionContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Our Collections",
              style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimaryContainer,
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
            ),
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                minimumSize: Size.zero,
                splashFactory: NoSplash.splashFactory,
              ),
              child: Text(
                "view all",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w300,
                  decoration: TextDecoration.underline,
                  color: Theme.of(context).colorScheme.outline,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wear_store_app/widgets/shadow_main.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton(
      {super.key,
      required this.label,
      this.backgroundColor,
      this.icon,
      required this.handleClick});

  final String label;
  final Color? backgroundColor;
  final SvgPicture? icon;
  final void Function() handleClick;

  @override
  Widget build(BuildContext context) {
    Widget content = Text(
      label,
      style: TextStyle(
        color: Theme.of(context).colorScheme.onPrimaryContainer,
        fontSize: 18,
        fontWeight: FontWeight.normal,
      ),
    );
    if (icon != null) {
      content = Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            label,
            style: TextStyle(
              color: Theme.of(context).colorScheme.onPrimaryContainer,
              fontSize: 18,
              fontWeight: FontWeight.normal,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          icon!,
        ],
      );
    }
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: ShadowMain(
        borderRadius: BorderRadius.circular(10),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor:
                backgroundColor ?? Theme.of(context).colorScheme.inversePrimary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(
                color: Theme.of(context).colorScheme.outline,
              ),
            ),
          ),
          onPressed: handleClick,
          child: content,
        ),
      ),
    );
  }
}

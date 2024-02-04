import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wear_store_app/widgets/shadow_main.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.label,
    required this.handleClick,
    this.backgroundColor,
    this.icon,
    this.foregroundColor,
    this.fontSize,
    this.height,
  });

  final String label;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final double? fontSize;
  final double? height;
  final SvgPicture? icon;
  final void Function() handleClick;

  @override
  Widget build(BuildContext context) {
    Widget content = Text(
      label,
      style: TextStyle(
        color:
            foregroundColor ?? Theme.of(context).colorScheme.onPrimaryContainer,
        fontSize: fontSize ?? 18,
        fontWeight: FontWeight.w400,
      ),
    );
    if (icon != null) {
      content = Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            label,
            style: TextStyle(
              color: foregroundColor ??
                  Theme.of(context).colorScheme.onPrimaryContainer,
              fontSize: fontSize ?? 18,
              fontWeight: FontWeight.w400,
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
      height: height ?? 48,
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

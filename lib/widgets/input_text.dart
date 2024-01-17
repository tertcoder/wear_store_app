import 'package:flutter/material.dart';

class InputText extends StatelessWidget {
  const InputText({super.key, required this.label, this.isHide = false});

  final String label;
  final bool isHide;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(
        fontWeight: FontWeight.normal,
        color: Theme.of(context).colorScheme.onPrimaryContainer,
      ),
      cursorColor: Theme.of(context).colorScheme.onPrimaryContainer,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(
          color: Theme.of(context).colorScheme.outline,
          fontSize: 14,
          fontWeight: FontWeight.w300,
        ),
        floatingLabelStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w300,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Theme.of(context).colorScheme.outline),
        ),
        contentPadding: const EdgeInsets.all(10),
        focusColor: Theme.of(context).colorScheme.onPrimaryContainer,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.onPrimaryContainer,
          ),
        ),
      ),
      obscureText: isHide,
    );
  }
}

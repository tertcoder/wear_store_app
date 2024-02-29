import 'package:flutter/material.dart';

enum TypeInput { email, password, text }

class InputText extends StatelessWidget {
  const InputText({
    super.key,
    required this.label,
    // this.handleValidator,
    this.handleOnSave,
    this.isHide = false,
    this.expands = false,
    this.keyboardType,
    this.type = TypeInput.text,
    this.focusNode,
  });

  final TypeInput type;
  final String label;
  final bool isHide;
  final bool expands;
  final FocusNode? focusNode;

  final TextInputType? keyboardType;
  // final String? Function(String? value)? handleValidator;
  final void Function(String? newValue)? handleOnSave;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      expands: expands,
      maxLines: expands ? null : 1,
      textAlignVertical:
          expands ? TextAlignVertical.top : TextAlignVertical.center,
      style: TextStyle(
        fontWeight: FontWeight.normal,
        color: Theme.of(context).colorScheme.onPrimaryContainer,
      ),
      cursorColor: Theme.of(context).colorScheme.onPrimaryContainer,
      decoration: InputDecoration(
        labelText: label,
        alignLabelWithHint: true,
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
      keyboardType: keyboardType,
      validator: (value) {
        if (type == TypeInput.email) {
          if (value == null || value.trim().isEmpty || !value.contains('@')) {
            return 'Please enter a valid email address';
          }
          return null;
        }
        if (type == TypeInput.password) {
          if (value == null || value.trim().isEmpty || value.length < 6) {
            return 'Please enter at least 6 characters.';
          }
          return null;
        }

        if (value == null || value.trim().isEmpty) {
          return 'Please fill this field.';
        }
        return null;
      },
      onSaved: (newValue) {
        handleOnSave!(newValue);
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wear_store_app/widgets/shadow_main.dart';

class ShoeImagePicker extends StatefulWidget {
  const ShoeImagePicker({super.key});

  @override
  State<ShoeImagePicker> createState() => _ShoeImagePickerState();
}

class _ShoeImagePickerState extends State<ShoeImagePicker> {
  final String _uploadImage = "assets/icons/upload_image_icon.svg";

  @override
  Widget build(BuildContext context) {
    return ShadowMain(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        width: 180,
        height: 180,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surfaceVariant,
          borderRadius: BorderRadius.circular(10),
          border: Border.fromBorderSide(
            BorderSide(
              color: Theme.of(context).colorScheme.outline,
            ),
          ),
        ),
        child: Center(
          child: SvgPicture.asset(
            _uploadImage,
            semanticsLabel: "Upload Image",
          ),
        ),
      ),
    );
  }
}

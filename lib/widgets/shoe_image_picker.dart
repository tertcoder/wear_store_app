import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wear_store_app/widgets/shadow_main.dart';

class ShoeImagePicker extends StatefulWidget {
  const ShoeImagePicker({super.key, required this.onPickImage});

  final void Function(File pickedImage) onPickImage;

  @override
  State<ShoeImagePicker> createState() => _ShoeImagePickerState();
}

class _ShoeImagePickerState extends State<ShoeImagePicker> {
  final String _uploadImage = "assets/icons/upload_image_icon.svg";
  File? _pickedImageFile;

  void _pickImage() async {
    final pickedImage = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (pickedImage == null) return;

    setState(() {
      _pickedImageFile = File(pickedImage.path);
    });

    widget.onPickImage(_pickedImageFile!);
  }

  @override
  Widget build(BuildContext context) {
    Widget imageContainer = Container(
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
    );
    if (_pickedImageFile != null) {
      imageContainer = Container(
        width: 180,
        height: 180,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: FileImage(_pickedImageFile!),
            fit: BoxFit.cover,
          ),
          color: Theme.of(context).colorScheme.surfaceVariant,
          borderRadius: BorderRadius.circular(10),
          border: Border.fromBorderSide(
            BorderSide(
              color: Theme.of(context).colorScheme.outline,
            ),
          ),
        ),
      );
    }
    return ShadowMain(
      borderRadius: BorderRadius.circular(10),
      child: GestureDetector(
        onTap: _pickImage,
        child: imageContainer,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wear_store_app/widgets/input_text.dart';
import 'package:wear_store_app/widgets/primary_button.dart';
import 'package:wear_store_app/widgets/shadow_main.dart';
import 'package:wear_store_app/widgets/shoe_image_picker.dart';

class NewShoe extends StatefulWidget {
  const NewShoe({super.key});

  @override
  State<NewShoe> createState() => _NewShoeState();
}

class _NewShoeState extends State<NewShoe> {
  final _form = GlobalKey<FormState>();

  String _enteredShoename = '';
  String _enteredShoebrand = '';
  double _enteredShoeprice = 0;
  String _enteredShoedescription = '';

  void _addNewShoe() {
    final isValid = _form.currentState!.validate();
    print(isValid);
    if (!isValid) return;
    _form.currentState!.save();
    print(_enteredShoename);
    print(_enteredShoebrand);
    print(_enteredShoeprice);
    print(_enteredShoedescription);
    _form.currentState!.reset();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: SingleChildScrollView(
            child: SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  const SizedBox(
                    height: 55,
                  ),
                  ShoeImagePicker(),
                  const SizedBox(
                    height: 40,
                  ),
                  Form(
                    key: _form,
                    child: Column(
                      children: [
                        InputText(
                          label: "Shoe name",
                          handleOnSave: (newValue) {
                            _enteredShoename = newValue!;
                          },
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        InputText(
                          label: "Shoe brand",
                          handleOnSave: (newValue) {
                            _enteredShoebrand = newValue!;
                          },
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        InputText(
                          label: "Price (\$)",
                          keyboardType: TextInputType.number,
                          handleOnSave: (newValue) {
                            _enteredShoeprice = double.parse(newValue!);
                          },
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: 200,
                          child: InputText(
                            expands: true,
                            label: "Description",
                            handleOnSave: (newValue) {
                              _enteredShoedescription = newValue!;
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        PrimaryButton(
                          label: "Add Shoe",
                          handleClick: _addNewShoe,
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

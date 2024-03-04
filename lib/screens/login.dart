import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:wear_store_app/screens/home.dart';
import 'package:wear_store_app/widgets/bottomNavBar/bottom_nav_bar.dart';
import 'package:wear_store_app/widgets/input_text.dart';
import 'package:wear_store_app/widgets/primary_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final String _logo = 'assets/icons/logo.svg';
  final String _google = 'assets/icons/google.svg';
  final String _facebook = 'assets/icons/facebook.svg';

  final _form = GlobalKey<FormState>();
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  final _firstnameFocusNode = FocusNode();
  final _lastnameFocusNode = FocusNode();

  @override
  void dispose() {
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    _firstnameFocusNode.dispose();
    _lastnameFocusNode.dispose();
    super.dispose();
  }

  bool _isLogin = true;

  String _enteredEmail = '';
  String _enteredPassword = '';
  String _enteredFirstname = '';
  String _enteredLastname = '';

  Future<void> _onSubmit() async {
    final isValid = _form.currentState!.validate();
    if (!isValid) return;
    _form.currentState!.save();

    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
    try {
      if (_isLogin) {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _enteredEmail,
          password: _enteredPassword,
        );
        _emailFocusNode.unfocus();
        _passwordFocusNode.unfocus();
      } else {
        final userCredentials =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _enteredEmail,
          password: _enteredPassword,
        );

        await FirebaseFirestore.instance
            .collection("users")
            .doc(userCredentials.user!.uid)
            .set({
          'firstname': _enteredFirstname,
          'lastname': _enteredLastname,
          'email': _enteredEmail,
        });

        _emailFocusNode.unfocus();
        _passwordFocusNode.unfocus();
        _firstnameFocusNode.unfocus();
        _lastnameFocusNode.unfocus();
      }
      await Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (ctx) => const BottomNavBar(),
        ),
      );
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);

      authErrorMessage(e.message ?? "Authentication Failed");
    }
  }

  void authErrorMessage(String errorMessage) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(errorMessage),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                _logo,
                semanticsLabel: 'WearStore Logo',
              ),
              Card(
                borderOnForeground: false,
                color: Theme.of(context).colorScheme.primaryContainer,
                elevation: 0,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: Column(
                      children: [
                        Form(
                          key: _form,
                          child: Column(
                            children: [
                              if (!_isLogin)
                                InputText(
                                  focusNode: _firstnameFocusNode,
                                  key: const ValueKey('firstname'),
                                  label: 'Firstname',
                                  handleOnSave: (newValue) {
                                    _enteredFirstname = newValue!;
                                  },
                                ),
                              if (!_isLogin)
                                const SizedBox(
                                  height: 14,
                                ),
                              if (!_isLogin)
                                InputText(
                                  focusNode: _lastnameFocusNode,
                                  key: const ValueKey('lastname'),
                                  label: 'Lastname',
                                  handleOnSave: (newValue) {
                                    _enteredLastname = newValue!;
                                  },
                                ),
                              if (!_isLogin)
                                const SizedBox(
                                  height: 12,
                                ),
                              InputText(
                                focusNode: _emailFocusNode,
                                key: const ValueKey('email'),
                                type: TypeInput.email,
                                label: 'Email address',
                                keyboardType: TextInputType.emailAddress,
                                handleOnSave: ((newValue) {
                                  _enteredEmail = newValue!;
                                }),
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              InputText(
                                focusNode: _passwordFocusNode,
                                key: const ValueKey('password'),
                                type: TypeInput.password,
                                label: 'Password',
                                isHide: true,
                                handleOnSave: (newValue) {
                                  _enteredPassword = newValue!;
                                },
                              ),
                              const SizedBox(
                                height: 14,
                              ),
                              PrimaryButton(
                                label: _isLogin ? 'Login' : 'Sign up',
                                handleClick: _onSubmit,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              _isLogin
                                  ? 'I don’t have an account?'
                                  : 'Already have an account?',
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.outline,
                                fontSize: 12,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            TextButton(
                              style: TextButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 3,
                                  horizontal: 8,
                                ),
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                minimumSize: Size.zero,
                                splashFactory: NoSplash
                                    .splashFactory, //** To disable the onTap background
                              ),
                              onPressed: () {
                                setState(() {
                                  _isLogin = !_isLogin;
                                });
                              },
                              child: Text(
                                _isLogin ? 'Sign up' : 'Login',
                                style: TextStyle(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onPrimaryContainer,
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Divider(
                          color: Theme.of(context)
                              .colorScheme
                              .outline
                              .withOpacity(0.25),
                          height: 1,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        PrimaryButton(
                          label: _isLogin
                              ? 'Log in with Google'
                              : 'Sign up with Google',
                          backgroundColor:
                              Theme.of(context).colorScheme.onInverseSurface,
                          icon: SvgPicture.asset(_google,
                              semanticsLabel: 'Google Icon'),
                          handleClick: () {},
                        ),
                        const SizedBox(
                          height: 14,
                        ),
                        PrimaryButton(
                          handleClick: () {},
                          label: _isLogin
                              ? 'Log in with Facebook'
                              : 'Sign up with Facebook',
                          backgroundColor:
                              Theme.of(context).colorScheme.onInverseSurface,
                          icon: SvgPicture.asset(_facebook,
                              semanticsLabel: 'Facebook Icon'),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

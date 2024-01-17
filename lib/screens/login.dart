import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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

  bool _isLogin = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Spacer(),
                  SvgPicture.asset(
                    _logo,
                    semanticsLabel: 'WearStore Logo',
                  ),
                  const SizedBox(
                    height: 28,
                  ),
                  Form(
                    child: Column(
                      children: [
                        if (!_isLogin) const InputText(label: 'Firstname'),
                        if (!_isLogin)
                          const SizedBox(
                            height: 14,
                          ),
                        if (!_isLogin) const InputText(label: 'Lastname'),
                        if (!_isLogin)
                          const SizedBox(
                            height: 14,
                          ),
                        const InputText(label: 'Email address'),
                        const SizedBox(
                          height: 14,
                        ),
                        const InputText(
                          label: 'Password',
                          isHide: true,
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        PrimaryButton(label: _isLogin ? "Login" : "Sign up"),
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
                    color:
                        Theme.of(context).colorScheme.outline.withOpacity(0.25),
                    height: 1,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  PrimaryButton(
                    label:
                        _isLogin ? "Log in with Google" : 'Sign up with Google',
                    backgroundColor:
                        Theme.of(context).colorScheme.onInverseSurface,
                    icon: SvgPicture.asset(_google,
                        semanticsLabel: "Google Icon"),
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  PrimaryButton(
                    label: _isLogin
                        ? "Log in with Facebook"
                        : "Sign up with Facebook",
                    backgroundColor:
                        Theme.of(context).colorScheme.onInverseSurface,
                    icon: SvgPicture.asset(_facebook,
                        semanticsLabel: "Facebook Icon"),
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

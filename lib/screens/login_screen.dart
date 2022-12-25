import 'package:flutter/material.dart';
import '../animations/slide_push.dart';
import '../utils/constants.dart';
import '../widgets/sign_form.dart';
import 'register_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: Constants.px_3,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                signInHeader(),
                const SignForm(
                  formHeight: 250,
                  submitText: Text('Sign in'),
                ),
                callToAction(context)
              ],
            )
          )
        ),
      )
    );
  }

  Row callToAction(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text ('Don\'t have an account?'),
        TextButton(
          onPressed: () {
            Navigator.of(context).push(
              SlidePush(widget: const RegisterScreen(), direction: AxisDirection.up)
            );
          },
          child: const Text('Register here!')
        ),
      ],
    );
  }

  Text signInHeader() => const Text(
    'Sign In', 
    style: TextStyle(
      fontSize: Constants.h_1
    ),
  );
}


import 'package:flutter/material.dart';
import 'package:thread_app/widgets/back_app_bar.dart';
import '../utils/constants.dart';
import '../widgets/sign_form.dart';

class RegisterScreen extends StatelessWidget {
const RegisterScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: BackAppBar(),
      body: Center(
        child: Container(
            constraints: const BoxConstraints(
            maxWidth: Constants.small_screen
          ),
          padding: Constants.px_3,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                signInHeader(),
                const SignForm(
                  formHeight: 250,
                  isLogin: false,
                  submitText: Text('Sign Up'),
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
        const Text ('Already have an account?'),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Log in here!')
        ),
      ],
    );
  }

  Text signInHeader() => const Text(
    'Sign Up', 
    style: TextStyle(
      fontSize: Constants.h_1
    ),
  );
}
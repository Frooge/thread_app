import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:thread_app/models/user_model.dart';
import 'package:thread_app/utils/constants.dart';
import 'package:thread_app/utils/generate_random.dart';

import '../providers/auth.dart';
import '../services/user_services.dart';
import '../utils/routes.dart';

class SignForm extends StatefulWidget {
  const SignForm({
    Key? key,
    required this.submitText,
    required this.isLogin,
    this.formHeight = 250.0,
    
  }) : super(key: key);

  final Text submitText;
  final bool isLogin;
  final double formHeight;

  @override
  State<SignForm> createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  bool _isPasswordVisible = false;
  String? errorMessage = '';

  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  Future<void> signInWithEmailAndPassword(BuildContext context, VoidCallback onSuccess) async {
    try {
      setState(() {
        errorMessage = '';
      });
      await Auth().signInWithEmailAndPassword(
        email: _controllerEmail.text,
        password: _controllerPassword.text
      );
      onSuccess.call();
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  Future<void> createUserWithEmailAndPassword(BuildContext context, VoidCallback onSuccess) async {
    try {
      setState(() {
        errorMessage = '';
      });
      await Auth().createUserWithEmailAndPassword(
        email: _controllerEmail.text,
        password: _controllerPassword.text
      );
      onSuccess.call();
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SizedBox(
        height: widget.formHeight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            formField(
              placeholder: 'Email',
              controller: _controllerEmail
            ),
            formField(
              placeholder: 'Password',
              controller: _controllerPassword,
              isPassword: true
            ),
            submitButton(context),
            Container(child: errorText())
          ],
        ),
      ),
    );
  }

  TextFormField formField({
    required String placeholder,
    required TextEditingController controller,
    bool isPassword = false
    }) {
    String? validateText(value) {
      if(value == null || value.isEmpty) {
        return 'Please input the following field';
      }
      return null;
    }

    return (isPassword) ? 
     TextFormField(
      decoration: InputDecoration(
        hintText: placeholder,
        suffixIcon: IconButton(
          icon: Icon(_isPasswordVisible ? Icons.visibility : Icons.visibility_off),
          onPressed: () {
            setState(() {
              _isPasswordVisible = !_isPasswordVisible;
            });
          },
        )
      ),
      obscureText: !_isPasswordVisible,
      validator: validateText,
      controller: controller,
    ) :
     TextFormField(
      decoration: InputDecoration(
        hintText: placeholder
      ),
      obscureText: false,
      validator: validateText,
      controller: controller,
    );
  }

  Text errorText() {
    return Text(
      errorMessage == '' ? '' : '$errorMessage',
      style: const TextStyle(
        color: Colors.red,
      ),
    );
  }

  Widget submitButton(BuildContext context) {
    void submitValidation() async {
      if(!_formKey.currentState!.validate()) {
        return;
      }

      if(widget.isLogin) {
        await signInWithEmailAndPassword(context, () async {
          Navigator.pushReplacementNamed(
            context,
            Routes.home
          );
        });
        
      } else {
        await createUserWithEmailAndPassword(context, () {
          Navigator.pop(context);
        });
      }
    }

    return Padding(
      padding: Constants.pt_2,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          textStyle: const TextStyle(
            fontSize: Constants.h_3
          ),
          backgroundColor: Colors.green,
          minimumSize: const Size.fromHeight(50),
        ),
        onPressed: submitValidation,
        child: widget.submitText
      ),
    );
  }
}
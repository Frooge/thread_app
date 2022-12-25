import 'package:flutter/material.dart';
import 'package:thread_app/utils/constants.dart';

class SignForm extends StatefulWidget {
  const SignForm({
    Key? key,
    required this.submitText,
    this.formHeight = 250.0,
  }) : super(key: key);

  final Text submitText;
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
            submitButton(),
            Container(child: errorText())
          ],
        ),
      ),
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

  Widget submitButton() {
    void submitValidation() {
      if(!_formKey.currentState!.validate()) {
        return;
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
}
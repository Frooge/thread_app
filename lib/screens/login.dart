import 'package:flutter/material.dart';
import '../widgets/base_app_bar.dart';

class Login extends StatelessWidget {
  const Login({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: const Text('home'),
      ),
      body: const Center(
        child: Text('hello')
      )
    );
  }
}
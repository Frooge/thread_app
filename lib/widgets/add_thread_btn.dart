import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../services/thread_services.dart';
import '../utils/constants.dart';

class AddThreadBtn extends StatefulWidget {
  const AddThreadBtn({
    Key? key,
  }) : super(key: key);

  @override
  State<AddThreadBtn> createState() => _AddThreadBtnState();
}

class _AddThreadBtnState extends State<AddThreadBtn> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _controllerName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        textStyle: const TextStyle(
          fontSize: Constants.h_3
        ),
        backgroundColor: Colors.grey.shade600,
        minimumSize: const Size.fromHeight(50),
      ),
      onPressed: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (BuildContext context) {
            // UDE : SizedBox instead of Container for whitespaces
            return Padding(
              padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Container(
                padding: Constants.px_3,
                height: 200,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      addForm(context),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
      child: const Text('Add a new thread')
    );
  }

  Form addForm(BuildContext context) {
    return Form(
        key: _formKey,
        child: SizedBox(
          height: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              textField(),
              submitBtn(context),
            ],
          ),
        ),
      );
  }

  TextFormField textField() {
    return TextFormField(
      decoration: const InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: Color.fromARGB(188, 143, 143, 143))
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: Color.fromARGB(188, 143, 143, 143))
        ),
        hintText: 'Enter a name'
      ),
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp("[a-zA-Z]")),
      ],
      controller: _controllerName,
    );
  }

  Padding submitBtn(BuildContext context) {
    return Padding(
      padding: Constants.py_1,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          textStyle: const TextStyle(
            fontSize: Constants.h_3
          ),
          backgroundColor: Colors.grey.shade600,
          minimumSize: const Size.fromHeight(50),
        ),
        onPressed: () {
          Navigator.pop(context);
          ThreadServices().addThread(name: _controllerName.text);
        },
        child: const Text('Submit')
      ),
    );
  }
}
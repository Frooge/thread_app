import 'package:flutter/material.dart';

import '../utils/constants.dart';

class ChatBox extends StatelessWidget {
const ChatBox({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Padding(
      padding: Constants.py_2,
      child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              chatInput(),
              chatSubmit()
            ],
          ),
    );
  }

  Expanded chatInput() {
    return const Expanded(
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: 'Enter a message',
        ),
      )
    );
  }

  SizedBox chatSubmit() {
    return SizedBox(
      width: 50,
      height: 50,
      child: IconButton(
        onPressed: () {
          
        },
        icon: const Icon(Icons.subdirectory_arrow_left)
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thread_app/services/thread_services.dart';

import '../models/user_model.dart';
import '../providers/current_thread.dart';
import '../utils/constants.dart';

class ChatBox extends StatefulWidget {
  const ChatBox({ Key? key }) : super(key: key);

  @override
  State<ChatBox> createState() => _ChatBoxState();
}

class _ChatBoxState extends State<ChatBox> {
  final TextEditingController _controllerMessage = TextEditingController();

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
    return Expanded(
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxHeight: 300,
        ),
        child: TextField(
          controller: _controllerMessage,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Enter a message',
          ),
          minLines: 1,
          maxLines: 3,
        ),
      )
    );
  }

  Widget chatSubmit() {
    return Builder(
      builder: (context) {
        UserModel user = context.watch<UserModel>();
        CurrentThread currentThread = context.watch<CurrentThread>();

        return SizedBox(
          width: 50,
          height: 50,
          child: IconButton(
            onPressed: () {
              if(_controllerMessage.text.isNotEmpty) {
                  ThreadServices().addMessage(
                  currentThread.thread,
                  message: _controllerMessage.text,
                  name: user.anonymousName,
                  image: user.image
                );
                _controllerMessage.clear();
              }
              FocusManager.instance.primaryFocus?.unfocus();
            },
            icon: const Icon(Icons.subdirectory_arrow_left)
          ),
        );
      }
    );
  }
}
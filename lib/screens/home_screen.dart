import 'package:flutter/material.dart';
import 'package:thread_app/widgets/base_app_bar.dart';
import 'package:thread_app/widgets/thread_drawer.dart';

import '../utils/constants.dart';
import '../widgets/chat_box.dart';
import '../widgets/thread_chat.dart';

class HomeScreen extends StatelessWidget {
const HomeScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: BaseAppBar(
        title: const Text('Thread.0000'),
      ),
      drawer: const ThreadDrawer(),
      body: Padding(
        padding: Constants.px_3,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            ThreadChat(),
            ChatBox()
          ],
        ),
      ),
    );
  }

  
}
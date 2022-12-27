import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thread_app/models/message_model.dart';
import 'package:thread_app/models/thread_model.dart';
import 'package:thread_app/providers/current_thread.dart';
import 'package:thread_app/services/thread_services.dart';
import 'package:thread_app/services/user_services.dart';
import 'package:thread_app/widgets/base_app_bar.dart';
import 'package:thread_app/widgets/thread_drawer.dart';

import '../models/user_model.dart';
import '../providers/auth.dart';
import '../utils/constants.dart';
import '../widgets/chat_box.dart';
import '../widgets/thread_chat.dart';

class HomeScreen extends StatelessWidget {
const HomeScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){

    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CurrentThread>(create: (_) => CurrentThread()),
        StreamProvider<UserModel>.value(
          value: UserServices().getCurrentUser(Auth().currentUser!.uid),
          initialData: UserModel.empty(),
        ),
        StreamProvider<List<ThreadModel>>.value(
          value: ThreadServices().getThreadList(),
          initialData: const [],
        ),
        
      ],
      child: Builder(
        builder: (BuildContext context) {
          CurrentThread currentThread = context.watch<CurrentThread>();

          return MultiProvider(
            providers: [
              StreamProvider<List<ThreadMessageModel>>.value(
                value: ThreadServices().getThreadMessages(currentThread.thread),
                initialData: const [],
              ),
            ],
            child: GestureDetector(
              onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
              child: Scaffold(
                appBar: BaseAppBar(
                  title: Text(currentThread.name),
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
              ),
            ),
          );
        }
      ),
    );
  }

}
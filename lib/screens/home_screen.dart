import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
    User? currentUser = Auth().currentUser;
    UserServices().checkIfUserExists(currentUser);

    return MultiProvider(
      providers: [
        StreamProvider<UserModel>.value(value: UserServices().getCurrentUser(currentUser!.uid), initialData: UserModel.empty(),),
      ],
      child: Builder(
        builder: (BuildContext context) {
          UserModel user = context.watch<UserModel>();

          return Scaffold(
            appBar: BaseAppBar(
              title: Text(user.email),
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
      ),
    );
  }

}
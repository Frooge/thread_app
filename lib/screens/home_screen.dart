import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thread_app/models/message_model.dart';
import 'package:thread_app/models/thread_model.dart';
import 'package:thread_app/providers/current_thread.dart';
import 'package:thread_app/providers/filter_thread.dart';
import 'package:thread_app/providers/limit_messages.dart';
import 'package:thread_app/providers/limit_threads.dart';
import 'package:thread_app/providers/search_query.dart';
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
        ChangeNotifierProvider<SearchQuery>(create: (_) => SearchQuery()),
        ChangeNotifierProvider<FilterThread>(create: (_) => FilterThread()),
        ChangeNotifierProvider<LimitMessages>(create: (_) => LimitMessages()),
        ChangeNotifierProvider<LimitThreads>(create: (_) => LimitThreads()),
        StreamProvider<UserModel>.value(
          value: UserServices().getCurrentUser(Auth().currentUser!.uid),
          initialData: UserModel.empty(),
        ),
      ],
      child: Builder(
        builder: (BuildContext context) {
          CurrentThread currentThread = context.watch<CurrentThread>();
          SearchQuery searchQuery = context.watch<SearchQuery>();
          LimitMessages limitMessages = context.watch<LimitMessages>();
          LimitThreads limitTthreads = context.watch<LimitThreads>();

          return MultiProvider(
            providers: [
              StreamProvider<List<ThreadMessageModel>>.value(
                value: ThreadServices().getThreadMessages(currentThread.thread, limit: limitMessages.currentLimit),
                initialData: const [],
              ),
              StreamProvider<List<ThreadModel>>.value(
                value: ThreadServices().getThreadList(query: searchQuery.query, limit: limitTthreads.currentLimit),
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
                onDrawerChanged: (isOpened) {
                  if(isOpened) {
                    searchQuery.changeQuery('');
                  }
                },
                body: bodyWidget(),
              ),
            ),
          );
        }
      ),
    );
  }

  Widget bodyWidget() {
    return Center(
      child: Container(
        constraints: const BoxConstraints(
        maxWidth: Constants.small_screen
        ),
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
      )
    );
  }

}
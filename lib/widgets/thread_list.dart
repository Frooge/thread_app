import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thread_app/models/thread_model.dart';
import 'package:thread_app/providers/current_thread.dart';
import 'package:thread_app/services/thread_services.dart';
import 'package:thread_app/utils/sort_filter.dart';

import '../models/user_model.dart';
import '../providers/filter_thread.dart';
import '../providers/limit_messages.dart';
import '../providers/limit_threads.dart';
import '../utils/constants.dart';

class ThreadList extends StatelessWidget {
  const ThreadList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        List<ThreadModel> threads = context.watch<List<ThreadModel>>();
        UserModel user = context.watch<UserModel>();
        FilterThread filterThread = context.watch<FilterThread>();
        LimitMessages limitMessages = context.watch<LimitMessages>();
        LimitThreads limitThreads = context.watch<LimitThreads>();
        
        var sf = SortFilter();
        sf.sortDescFavorites(threads);

        if(filterThread.filterFav) {
          threads = sf.filterFavorites(threads, user.favoriteList);
        }

        return Expanded(
          child: Scrollbar(
            child: Padding(
              padding: Constants.pr_1,
              child: NotificationListener<ScrollEndNotification>(
                  onNotification: (scrollEnd) {
                    final metrics = scrollEnd.metrics;
                    if (metrics.atEdge) {
                      bool isTop = metrics.pixels == 0;
                      if (!isTop) {
                        limitThreads.incrementLimit();
                      }
                    }
                    return true;
                  },
                  child: ListView.builder(
                  itemCount: threads.length,
                  itemBuilder: (context, index) {
                    return threadCard(context, thread: threads[index], limitMessages: limitMessages, limitThreads: limitThreads);
                  },
                ),
              ),
            ),
          ),
        );
      }
    );
  }

  Card threadCard(BuildContext context,
  {required ThreadModel thread,
  required LimitMessages limitMessages, 
  required LimitThreads limitThreads
  }) {
    return Card(
      child: InkWell(
        onTap: () {
          final CurrentThread currentThread = context.read<CurrentThread>();
          currentThread.switchThread(
            thread.id, thread.threadName,
            limitMessages: limitMessages,
            limitThreads: limitThreads
          );
          Navigator.pop(context);
        },
        child: Padding(
          padding: Constants.p_1,
          child: Row(
            children: [
              threadName(title: thread.threadName),
              const Spacer(),
              favoriteBtn(threadId: thread.id, favorites: thread.favorites),
            ],
          ),
        ),
      )
    );
  }

  Text threadName({required String title}) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: Constants.h_3
      ),
    );
  }

  Widget favoriteBtn({required String threadId, required int favorites}) {
    return Builder(
      builder: (context) {
        UserModel user = context.watch<UserModel>();

        return Row(
          children: [
            Text('$favorites'),
            IconButton(
              onPressed: () {
                ThreadServices().toggleFavoriteThread(threadId, userId: user.id, likeList: user.favoriteList);
              },
              icon: Icon(
                user.favoriteList.contains(threadId) ? Icons.favorite :  Icons.favorite_outline,
                color: user.favoriteList.contains(threadId) ? Colors.redAccent : Colors.white,
              ),
            ),
          ],
        );
      }
    );
  }
}
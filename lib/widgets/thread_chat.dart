import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:thread_app/services/thread_services.dart';

import '../models/message_model.dart';
import '../models/user_model.dart';
import '../providers/limit_messages.dart';
import '../utils/constants.dart';

class ThreadChat extends StatelessWidget {
const ThreadChat({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Builder(
      builder: (context) {
        List<ThreadMessageModel> threadMessages = context.watch<List<ThreadMessageModel>>();
        LimitMessages limit = context.watch<LimitMessages>();

        return Expanded(
          child: Padding(
            padding: Constants.pt_2,
            child: Scrollbar(
              child: Padding(
                padding: Constants.px_1,
                child: NotificationListener<ScrollEndNotification>(
                  onNotification: (scrollEnd) {
                    final metrics = scrollEnd.metrics;
                    if (metrics.atEdge) {
                      bool isTop = metrics.pixels == 0;
                      if (!isTop) {
                        limit.incrementLimit();
                      }
                    }
                    return true;
                  },
                  child: ListView.builder(
                    reverse: true,
                    itemCount: threadMessages.length,
                    itemBuilder: ((context, index) {
                      return chatMessage(context, threadMessage: threadMessages[index]);
                    }),
                  ),
                ),
              ),
            ),
          ),
        );
      }
    );
  }

  Widget chatMessage(BuildContext context, {required ThreadMessageModel threadMessage}) {
    return Container(
      margin: Constants.pb_1,
      child: Card(
        color: Colors.grey.shade800,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            chatUser(image: threadMessage.userImage),
            chatText(threadMessage),
          ],
        ),
      ),
    );
  }

  Padding chatUser({required String image}) {
    return Padding(
      padding: Constants.plt_1,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Image.asset(
        image.isEmpty ? 'assets/images/avatar-0.png' : 'assets/images/avatar-$image.png',
        width: Constants.avatar_chat_size,
        height: Constants.avatar_chat_size,
        ),
      ),
    );
  }

  Expanded chatText(ThreadMessageModel threadMessage) {

    return Expanded(
      child: Container(
        padding: Constants.p_1,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            sender(threadMessage.userName),
            dateSent(threadMessage.timestamp),
            textMessage(text: threadMessage.message),
            heartEmote(threadMessage)
          ],
        )
      ),
    );
  }

  Text sender(String person) {
    return Text(
      'Sent by @$person',
      style: const TextStyle(
        color: Constants.color_grey,
      ),
    );
  }

  Padding dateSent(Timestamp timestamp) {
    var date = DateTime.fromMillisecondsSinceEpoch(timestamp.seconds * 1000);
    var dateFormat = DateFormat('MM/dd/yyyy, HH:mm').format(date);

    return Padding(
      padding: Constants.pb_1,
      child: Text(
        dateFormat.toString(),
        style: const TextStyle(
          color: Constants.color_grey,
        )
      ),
    );
  }

  Text textMessage({required String text}) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: Constants.h_3,
      ),
    );
  }

  Widget heartEmote(ThreadMessageModel threadMessage) {
    return Builder(
      builder: (context) {
        UserModel user = context.watch<UserModel>();
        bool liked = user.likedMessagesList.contains(threadMessage.id);

        return Padding(
          padding: Constants.pt_1,
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
                  color: liked? Colors.yellow.shade200 : Colors.grey.shade600
                ),
                width: Constants.emote_size,
                height: Constants.emote_size,
                child: IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    ThreadServices().toggleLikeMessage(
                      threadMessage.id,
                      threadId: threadMessage.threadId,
                      userId: user.id,
                      likedMessagesList: user.likedMessagesList
                    );
                  },
                  icon: Icon(
                    liked ? Icons.favorite : Icons.favorite_border,
                    size: Constants.h_3,
                    color: liked ? Colors.redAccent : Colors.grey.shade300,
                  ),
                ),
              ),
              Padding(
                padding: Constants.pt_1,
                child: Text('${threadMessage.likes}')
              )
            ],
          ),
        );
      }
    );
  }
}
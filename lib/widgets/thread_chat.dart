import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:thread_app/services/thread_services.dart';

import '../models/message_model.dart';
import '../models/user_model.dart';
import '../utils/constants.dart';

class ThreadChat extends StatelessWidget {
const ThreadChat({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Builder(
      builder: (context) {
        List<ThreadMessageModel> threadMessages = context.watch<List<ThreadMessageModel>>();

        return Expanded(
          child: Padding(
            padding: Constants.pt_2,
            child: Scrollbar(
              child: Padding(
                padding: Constants.px_1,
                child: ListView.builder(
                  reverse: true,
                  itemCount: threadMessages.length,
                  itemBuilder: ((context, index) {
                    return chatMessage(context, threadMessages, index);
                  }),
                ),
              ),
            ),
          ),
        );
      }
    );
  }

  Widget chatMessage(BuildContext context, List<ThreadMessageModel> threadMessages, int index) {
    return Container(
      margin: Constants.pb_1,
      child: Card(
        color: Colors.grey.shade800,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            chatUser(),
            chatText(threadMessages[index]),
          ],
        ),
      ),
    );
  }

  Padding chatUser() {
    return Padding(
      padding: Constants.plt_1,
      child: Container(
        padding: Constants.p_1,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3),
          color:Colors.grey.shade700,
        ),
        child: const Icon(Icons.person)
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
                  color: liked ? Colors.yellow.shade300 : Colors.grey.shade600,
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
                  icon: const Icon(
                    Icons.favorite,
                    size: Constants.h_3,
                    color: Colors.redAccent,
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
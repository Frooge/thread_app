import 'package:flutter/material.dart';

import '../utils/constants.dart';

class ThreadChat extends StatelessWidget {
const ThreadChat({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Expanded(
      child: Padding(
        padding: Constants.pt_2,
        child: Scrollbar(
          child: Padding(
            padding: Constants.px_1,
            child: ListView.builder(
              reverse: true,
              itemCount: 15,
              itemBuilder: ((context, index) {
                return chatMessage(context, index);
              }),
            ),
          ),
        ),
      ),
    );
  }

  Widget chatMessage(BuildContext context, int index) {
    return Container(
      margin: Constants.pb_1,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          chatUser(),
          chatText(index, 'person $index'),
        ],
      ),
    );
  }

  Padding chatUser() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 70),
      child: Padding(
        padding: Constants.p_1,
        child: Container(
          padding: Constants.p_1,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3),
            color:Colors.grey.shade700,
          ),
          child: const Icon(Icons.person)
        ),
      ),
    );
  }

  Expanded chatText(int index, String person) {

    return Expanded(
      child: Card(
        color: Colors.grey.shade800,
        child: Container(
          padding: Constants.p_1,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              sender(person),
              textMessage(index),
              heartEmote()
            ],
          )
        ),
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

  Text textMessage(int index) {
    return Text(
      '$index Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
      style: const TextStyle(
        fontSize: Constants.h_3,
      ),
    );
  }

  Padding heartEmote() {
    return Padding(
      padding: Constants.pt_1,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3),
              color: Colors.grey.shade600,
            ),
            width: Constants.emote_size,
            height: Constants.emote_size,
            child: IconButton(
              onPressed: () {
                
              },
              icon: const Icon(
                Icons.favorite,
                size: Constants.h_3,
                color: Colors.redAccent,
              ),
            ),
          ),
          const Padding(
            padding: Constants.pt_1,
            child: Text('0')
          )
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';

import '../utils/constants.dart';

class ThreadList extends StatelessWidget {
  const ThreadList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: Constants.pt_2,
        child: Scrollbar(
          child: Padding(
            padding: Constants.p_1_nr,
            child: ListView.builder(
              itemCount: 15,
              itemBuilder: (context, index) {
                return threadCard();
              },
            ),
          ),
        ),
      ),
    );
  }

  Card threadCard() {
    return Card(
      child: Padding(
        padding: Constants.p_1,
        child: Row(
          children: [
            threadName(),
            const Spacer(),
            favoriteBtn(),
          ],
        ),
      )
    );
  }

  Text threadName() {
    return Text(
      'Thread.0000',
      style: TextStyle(
        fontSize: Constants.h_3
      ),
    );
  }

  IconButton favoriteBtn() {
    return IconButton(
      onPressed: () {

      },
      icon: Icon(Icons.favorite_outline)
    );
  }
}
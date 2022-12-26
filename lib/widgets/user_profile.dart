import 'package:flutter/material.dart';

import '../utils/constants.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Constants.p_3,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          userImage(),
          userName(),
          const Spacer(),
          resetBtn(),
        ],
      ),
    );
  }

  Container userImage() {
    return Container(
      padding: Constants.p_1,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3),
        color:Colors.grey.shade700,
      ),
      child: const Icon(
        size: 50,
        Icons.person
      ),
    );
  }

  Padding userName() {
    return Padding(
      padding: Constants.px_2,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Anon.12345',
            style: TextStyle(
              fontSize: Constants.h_2
            ),
          ),
          Text(
            'user@mail.com',
            style: TextStyle(
              fontSize: Constants.h_3
            ),
          ),
        ],
      ),
    );
  }

  ElevatedButton resetBtn() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.redAccent
      ),
      onPressed: () {
        
      },
      child: Text('Reset ID'),
    );
  }
}
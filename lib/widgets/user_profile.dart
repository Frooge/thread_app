import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/user_model.dart';
import '../utils/constants.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        UserModel user = context.watch<UserModel>();
        return Padding(
          padding: Constants.p_3,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              userImage(),
              userName(username: user.anonymousName,email: user.email),
              const Spacer(),
              resetBtn(),
            ],
          ),
        );
      }
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

  Padding userName({required String username, required String email}) {
    return Padding(
      padding: Constants.px_2,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            username,
            style: const TextStyle(
              fontSize: Constants.h_2
            ),
          ),
          Text(
            email,
            style: const TextStyle(
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
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thread_app/services/user_services.dart';

import '../models/user_model.dart';
import '../providers/auth.dart';
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
              userImage(image: user.image),
              userName(username: user.anonymousName,email: user.email),
              const Spacer(),
              resetBtn(),
            ],
          ),
        );
      }
    );
  }

  Widget userImage({required String image}) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: Image.asset(
        image.isEmpty ? 'assets/images/avatar-0.png' : 'assets/images/avatar-$image.png',
        width: Constants.avatar_size,
        height: Constants.avatar_size,
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
        UserServices().resetAnonId(Auth().currentUser!);
      },
      child: const Text('Reset ID'),
    );
  }
}
import 'package:flutter/material.dart';

import '../utils/constants.dart';
import '../widgets/back_app_bar.dart';
import '../widgets/user_profile.dart';


class SettingsScreen extends StatelessWidget {
const SettingsScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: BackAppBar(),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const UserProfile(),
          menuDivider(),
          menuText('Help'),
          menuDivider(),
          menuText('Toggle dark mode (WIP)'),
          menuDivider(),
          logOutBtn(),
          menuDivider(),
        ],
      )
    );
  }

  Widget menuText(String text, {Color color = Colors.white}) {
    return Padding(
      padding: Constants.py_2,
      child: Text(
        text,
        style: TextStyle(
          fontSize: Constants.h_3,
          color: color,
        ),
      ),
    );
  }

  TextButton logOutBtn() {
    return TextButton(
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
      ),
      onPressed: () {
        
      },
      child: menuText('Log out', color: Colors.redAccent)
    );
  }

  Widget menuDivider() {
    return  Divider(
      thickness: 1,
      color: Colors.grey.shade700
    );
  }
}
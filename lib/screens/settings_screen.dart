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
          menuTile('Help'),
          menuDivider(),
          menuTile('Toggle dark mode (WIP)'),
          menuDivider(),
          menuTile('Log Out', color: Colors.redAccent),
          menuDivider(),
        ],
      )
    );
  }

  Widget menuTile(String title, {Color color = Colors.white}) {
    return ListTile(
      title: Center(
        child: Text(
          title,
          style: TextStyle(
            fontSize: Constants.h_3,
            color: color,
          ),
        ),
      ),
      onTap: () {
        
      },
    );
  }

  Widget menuDivider() {
    return  Divider(
      thickness: 1,
      color: Colors.grey.shade700
    );
  }
}
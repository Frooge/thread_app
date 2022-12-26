import 'package:flutter/material.dart';

import '../providers/auth.dart';
import '../utils/constants.dart';
import '../utils/routes.dart';
import '../widgets/back_app_bar.dart';
import '../widgets/user_profile.dart';


class SettingsScreen extends StatelessWidget {
  const SettingsScreen({ Key? key }) : super(key: key);

  Future<void> signOut(BuildContext context, VoidCallback onSuccess) async {
    await Auth().signOut();
    onSuccess.call();
  }

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
          menuTile(
            'Log Out',
            color: Colors.redAccent,
            onTap: () {
              signOut(context, () {
                Navigator.pushReplacementNamed(
                  context,
                  Routes.login
                );
              });
            }
          ),
          menuDivider(),
        ],
      )
    );
  }

  Widget menuTile(String title, {Color color = Colors.white, void Function()? onTap}) {
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
      onTap: onTap,
    );
  }

  Widget menuDivider() {
    return  Divider(
      thickness: 1,
      color: Colors.grey.shade700
    );
  }
}
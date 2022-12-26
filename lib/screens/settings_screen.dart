import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thread_app/services/user_services.dart';

import '../models/user_model.dart';
import '../providers/auth.dart';
import '../utils/constants.dart';
import '../utils/routes.dart';
import '../widgets/back_app_bar.dart';
import '../widgets/user_profile.dart';


class SettingsScreen extends StatefulWidget {
  const SettingsScreen({ Key? key }) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  Future<void> signOut(BuildContext context, VoidCallback onSuccess) async {
    await Auth().signOut();
    onSuccess.call();
  }

  String uid = '';

  @override
  void initState() {
    setState(() {
      uid = Auth().currentUser!.uid;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context){
    return StreamProvider<UserModel>.value(
      value: UserServices().getCurrentUser(uid),
      initialData: UserModel.empty(),
      child: Scaffold(
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
      ),
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
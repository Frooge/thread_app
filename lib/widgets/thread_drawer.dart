import 'package:flutter/material.dart';

import '../utils/constants.dart';
import 'add_thread_btn.dart';
import 'search_box.dart';
import 'thread_list.dart';

class ThreadDrawer extends StatelessWidget {
  const ThreadDrawer({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Drawer(
      child: Padding(
        padding: Constants.p_3,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            headerPadding(context),
            const SearchBox(),
            const ThreadList(),
            const AddThreadBtn()
          ],
        ),
      ),
    );
  }

  Padding headerPadding(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top)
    );
  }
  
}

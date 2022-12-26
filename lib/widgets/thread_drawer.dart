import 'package:flutter/material.dart';

import '../utils/constants.dart';
import 'search_box.dart';
import 'thread_list.dart';

class ThreadDrawer extends StatelessWidget {
const ThreadDrawer({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Drawer(
      child: Padding(
        padding: Constants.px_3,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            headerPadding(context),
            const SearchBox(),
            const ThreadList(),
          ],
        ),
      ),
    );
  }

  Padding headerPadding(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top + 24)
    );
  }
  
}
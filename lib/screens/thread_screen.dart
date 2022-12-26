import 'package:flutter/material.dart';

import '../utils/constants.dart';
import '../widgets/back_app_bar.dart';
import '../widgets/search_box.dart';
import '../widgets/thread_list.dart';

class ThreadScreen extends StatelessWidget {
const ThreadScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: BackAppBar(),
      body: Padding(
        padding: Constants.px_3,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SearchBox(),
            ThreadList(),
          ],
        ),
      )
    );
  }
  
}
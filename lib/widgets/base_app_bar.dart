import 'package:flutter/material.dart';
import 'toggle_theme_btn.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  BaseAppBar({
    Key? key,
    backgroundColor,
    this.title = const Text(''),
    appBar,
  }) : super(key: key);

  final Color backgroundColor = Colors.red;
  final Text title;
  final AppBar appBar = AppBar();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title,
      actions: const [
        ToggleThemeBtn()
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
}
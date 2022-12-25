import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/theme_provider.dart';
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
      leading: navigationList(),
      actions: [
        modeIndicator(context),
        const ToggleThemeBtn()
      ],
    );
  }

  IconButton navigationList() {
    return IconButton(
      onPressed: () {
        
      },
      icon: const Icon(Icons.list),
    );
  }

  Center modeIndicator(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();
    return Center(
      child: Icon(
        themeProvider.isDarkMode ? Icons.brightness_2 : Icons.brightness_1,
        color: Colors.yellow,
      ),
    );
  } 

  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
}
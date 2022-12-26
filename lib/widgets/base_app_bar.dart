import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thread_app/screens/settings_screen.dart';
import '../animations/slide_push.dart';
import '../providers/theme_provider.dart';
import '../utils/routes.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  BaseAppBar({
    Key? key,
    this.title = const Text(''),
    appBar,
  }) : super(key: key);

  final Text title;
  final AppBar appBar = AppBar();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title,
      actions: [
        navigationSettings(context),
        // modeIndicator(context),
        // const ToggleThemeBtn()
      ],
    );
  }

  IconButton navigationSettings(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.push(
            context,
            SlidePush(
              widget: const SettingsScreen(),
              direction: AxisDirection.left,
              routeName: Routes.settings
            )
          );
        },
        icon: const Icon(Icons.settings)
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
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/theme_provider.dart';

class ToggleThemeBtn extends StatelessWidget {
  const ToggleThemeBtn({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    final themeProvider = context.watch<ThemeProvider>();

    return Switch.adaptive(
      value: themeProvider.isDarkMode,
      onChanged: (value) {
        final themeProvider = context.read<ThemeProvider>();
        themeProvider.toggleTheme(value);
      }
    );
  }
}
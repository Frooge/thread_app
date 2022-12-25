import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thread_app/screens/login.dart';
import 'providers/theme_provider.dart';
import 'utils/app_themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      builder: (context, _) {
        final themeProvider = Provider.of<ThemeProvider>(context);

        return MaterialApp(
          title: 'Thread',
          themeMode: themeProvider.themeMode,
          theme: AppThemes().ligthTheme(),
          darkTheme: AppThemes().darkTheme(),
          debugShowCheckedModeBanner: false,
          home: const Login(),
        );
      },
    );
  }
}

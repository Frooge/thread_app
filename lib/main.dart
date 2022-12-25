import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thread_app/screens/login_screen.dart';
import 'providers/theme_provider.dart';
import 'utils/app_themes.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider())
      ],
      child: const MyApp()
    )
  );
}

class MyApp extends StatelessWidget {
const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Builder(
      builder: (BuildContext context) {
        final themeProvider = context.watch<ThemeProvider>();

        return MaterialApp(
          title: 'Thread',
          themeMode: themeProvider.themeMode,
          theme: AppThemes().ligthTheme(),
          darkTheme: AppThemes().darkTheme(),
          debugShowCheckedModeBanner: false,
          home: const LoginScreen(),
        );
      }
    );
  }
}

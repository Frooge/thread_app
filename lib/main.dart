import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart';
import 'providers/auth.dart';
import 'providers/theme_provider.dart';
import 'screens/home_screen.dart';
import 'screens/login_screen.dart';
import 'utils/app_themes.dart';
import 'utils/routes.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

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
          routes: Routes.getRoutes(),
          home: widgetTree(),
        );
      }
    );
  }

  StreamBuilder<User?> widgetTree() {
    return StreamBuilder(
      stream: Auth().authStateChanges,
      builder: ((context, snapshot) {
        if(snapshot.hasData) {
          return const HomeScreen();
        } else {
          return const LoginScreen();
        }
      }),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:to_do_app/core/theme/theme.dart';
import 'package:to_do_app/features/auth/presentation/views/splash/splash_view.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: getThemeData(),
      darkTheme: getThemeDarkData(),
      themeMode: ThemeMode.light,
      home: const SplashView(),
    );
  }
}

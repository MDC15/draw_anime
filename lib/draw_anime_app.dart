import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_app/shared/themes/app_theme.dart';
import 'package:flutter_app/features/intro/intro_page.dart';
import 'package:flutter_app/features/intro/intro_provider.dart';
import 'package:flutter_app/features/home/home_provider.dart';
import 'package:flutter_app/features/ar_overlay/ar_provider.dart';
import 'package:flutter_app/features/user/user_provider.dart';

class DrawAnimeApp extends StatelessWidget {
  const DrawAnimeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => IntroProvider()),
        ChangeNotifierProvider(create: (_) => HomeProvider()),
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => ArProvider()),
      ],
      child: MaterialApp(
        title: 'Draw Anime App',
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.system,
        home: const IntroPage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

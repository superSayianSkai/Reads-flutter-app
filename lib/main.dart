import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:be_calm/screens/home.dart';
import 'package:be_calm/state/blog_provider.dart';
import 'package:be_calm/state/video_provider.dart';
import 'package:be_calm/utils/app_theme_colors.dart';
import 'package:be_calm/utils/app_theme_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => BlogProvider()),
        ChangeNotifierProvider(create: (_) => VideoProvider()..initialise()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: .fromSeed(seedColor: Colors.deepPurple),
          textTheme: AppThemeFonts.textTheme(),
          scaffoldBackgroundColor: AppThemeColors.scafoldbackground,
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: "/",
        routes: {'/': (context) => const Home()},
      ),
    );
  }
}

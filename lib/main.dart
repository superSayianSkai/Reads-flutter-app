import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reads/screens/home.dart';
import 'package:reads/state/blog_provider.dart';
import 'package:reads/utils/app_theme_colors.dart';
import 'package:reads/utils/app_theme_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => BlogProvider())],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: .fromSeed(seedColor: Colors.deepPurple),
          textTheme: AppThemeFonts.textTheme(),
          scaffoldBackgroundColor: AppThemeColors.scafoldbackground,
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: "/",
        routes: {
          '/': (context) => const Home(),
        },
      ),
    );
  }
}

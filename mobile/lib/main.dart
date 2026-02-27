import 'package:be_calm/features/home/state/home_screen_shell_provider.dart';
import 'package:be_calm/features/onboarding/provider/onboarding_screen_provider.dart';
import 'package:be_calm/features/onboarding/screen/onboarding_screen.dart';
import 'package:be_calm/features/home/presentation/screens/home_screen_shell.dart';
import 'package:be_calm/features/explore/state/search_carousel_provider.dart';
import 'package:be_calm/shared/state/video_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:be_calm/shared/state/blog_provider.dart';
import 'package:be_calm/shared/utils/app_theme_colors.dart';
import 'package:be_calm/shared/utils/app_theme_fonts.dart';


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
        ChangeNotifierProvider(create: (_) => VideoProvider()),
        ChangeNotifierProvider(create: (_) => HomeScreenShellProvider()),
        ChangeNotifierProvider(create: (_) => SearchProvider()),
        ChangeNotifierProvider(create: (_) => OnboardingScreenProvider()),
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
        routes: {
          '/': (context) => OnboardingScreens(),
          "home": (context) => HomeScreenShell(),
        },
      ),
    );
  }
}

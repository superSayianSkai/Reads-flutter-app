import 'package:be_calm/features/user/presentation/widget/profile_list.dart';
import 'package:be_calm/shared/utils/app_theme_colors.dart';
import 'package:be_calm/shared/utils/app_theme_fonts.dart';
import 'package:be_calm/shared/utils/app_theme_spacing.dart';
import 'package:be_calm/features/user/presentation/screens/profile_list_title.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class User extends StatelessWidget {
  const User({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppThemeColors.scafoldbackground,
          leading: Padding(
            padding: EdgeInsets.symmetric(horizontal: 19),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Profile",
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Icon(LucideIcons.moreVertical),
              ],
            ),
          ),
          leadingWidth: double.infinity,
        ),
        body: Center(
          child: Column(
            children: [
              AppThemeSpacing.largeSpacing,
              Container(
                width: 150,
                height:150,
                decoration: BoxDecoration(
                  color: AppThemeColors.black,
                  borderRadius: BorderRadius.circular(100),
                  image: DecorationImage(
                    image: AssetImage("assets/images/girl-laugh-removebg.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              AppThemeSpacing.mediumSpacing,
              Text('SaiyanSkai', style: AppThemeFonts.headlineMedium),
              AppThemeSpacing.largeSpacing,
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                child: ProfileList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

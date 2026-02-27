import 'package:be_calm/utils/app_theme_colors.dart';
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  final String routeName;

  const MyButton({super.key, required this.text, required this.routeName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamedAndRemoveUntil(context, routeName, (route) => false);
      },
      child: Container(
        width: 354,
        height: 56,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppThemeColors.buttonColorActive,
        ),
        child: Center(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(color: Colors.white, fontSize: 20),
          ),
        ),
      ),
    );
  }
}

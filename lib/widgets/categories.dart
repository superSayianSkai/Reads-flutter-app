import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reads/state/blog_provider.dart';
import 'package:reads/utils/app_theme_colors.dart';

class Categories extends StatelessWidget {
  final String category;

  const Categories({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final blogProvider = context.watch<BlogProvider>();
    final isSelected = blogProvider.tapedCategory == category;
    return GestureDetector(
      onTap: () => blogProvider.getTapedCategory(category),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 14, vertical: 4),
        margin: EdgeInsets.symmetric(horizontal: 5.0),
        decoration: BoxDecoration(
          color: isSelected
              ? AppThemeColors.buttonColorActive
              : AppThemeColors.buttonColorNonActive,
          border: Border.all(
            width: .4,
            color: AppThemeColors.buttonBorderColor,
          ),
          borderRadius: BorderRadius.circular(100),
        ),
        child: Center(
          child: Text(
            category,
            style: isSelected
                ? Theme.of(
                    context,
                  ).textTheme.headlineMedium?.copyWith(color: Colors.white)
                : Theme.of(context).textTheme.headlineMedium,
          ),
        ),
      ),
    );
  }
}

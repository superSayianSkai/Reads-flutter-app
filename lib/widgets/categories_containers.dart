import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:be_calm/state/blog_provider.dart';
import 'package:be_calm/utils/app_theme_colors.dart';

class CategoriesContainers extends StatelessWidget {
  final String category;
  final bool useAge;
  final VoidCallback? onPressed;

  const CategoriesContainers({
    super.key,
    required this.category,
    required this.useAge,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final blogProvider = context.watch<BlogProvider>();
    final isSelected = blogProvider.tapedCategory == category;

    if (useAge == true) {
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

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 14, vertical: 0),
        margin: EdgeInsets.symmetric(horizontal: 5.0),
        decoration: BoxDecoration(
          color: AppThemeColors.defaultColor,
          border: Border.all(
            width: .4,
            color: AppThemeColors.buttonBorderColor,
          ),
          borderRadius: BorderRadius.circular(100),
        ),
        child: Center(
          child: Text(
            category,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontSize: 14,
              color: AppThemeColors.subCategoryText,
            ),
          ),
        ),
      ),
    );
  }
}

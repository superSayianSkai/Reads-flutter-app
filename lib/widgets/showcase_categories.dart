import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:provider/provider.dart';
import 'package:be_calm/models/blog.dart';
import 'package:be_calm/state/blog_provider.dart';
import 'package:be_calm/utils/app_theme_spacing.dart';
import 'package:be_calm/utils/string_extension.dart';

class ShowCase extends StatelessWidget {
  final bool normalUse;
  final String type;
  final String duration;
  final String topic;
  final String tappedUpperCategory;
  final String category;
  final Blog blog;
  final String image;
  final VoidCallback? onPressed;

  const ShowCase({
    super.key,
    required this.topic,
    required this.duration,
    required this.type,
    required this.normalUse,
    required this.category,
    required this.tappedUpperCategory,
    required this.blog,
    required this.image,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final blogProvider = context.watch<BlogProvider>();
    return Padding(
      padding: const EdgeInsets.fromLTRB(1, 10, 0, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (tappedUpperCategory != "All topics") AppThemeSpacing.largeSpacing,
          Container(
            width: normalUse && tappedUpperCategory.contains('All topics')
                ? MediaQuery.of(context).size.width * 0.75
                : MediaQuery.of(context).size.width * 0.92,
            height: 150,
            padding: EdgeInsets.zero,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              color: tappedUpperCategory == "All topics"
                  ? blogProvider.getCategoryColor(category)
                  : Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: GestureDetector(
              onTap: onPressed,
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10.0, 30, 20.0, 0),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10.0, 0, 10, 18),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Row(
                            children: [
                              type.toLowerCase() == "article"
                                  ? Icon(
                                      LucideIcons.bookOpen,
                                      size: 18,
                                      weight: 1.0,
                                    )
                                  : Icon(
                                      LucideIcons.video,
                                      size: 20,
                                      weight: 1.0,
                                    ),
                              AppThemeSpacing.smallSpacing,
                              Text(
                                type.capitalize,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              Icon(LucideIcons.dot),
                              Text(duration),
                            ],
                          ),

                          Row(
                            children: [
                              SizedBox(
                                width: 180,
                                child: Text(
                                  topic,
                                  style: Theme.of(
                                    context,
                                  ).textTheme.headlineMedium,
                                  softWrap: true,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    right: -250,
                    top: 0,
                    left: 0,
                    bottom: 0,
                    child: Image.asset(image),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

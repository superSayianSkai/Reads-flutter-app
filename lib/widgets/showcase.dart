import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:provider/provider.dart';
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
  final String image;
  final String? authorName;
  final String? authorPic;
  final VoidCallback? onPressed;

  const ShowCase({
    super.key,
    required this.topic,
    required this.duration,
    required this.type,
    required this.normalUse,
    required this.category,
    required this.tappedUpperCategory,
    required this.image,
    this.authorName,
    this.authorPic,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final blogProvider = context.watch<BlogProvider>();
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 2, 0, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (tappedUpperCategory != "All topics" && tappedUpperCategory != "")
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 12,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 25,
                        height: 25,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: authorPic != null
                              ? DecorationImage(
                                  image: AssetImage(authorPic!),
                                  fit: BoxFit.cover,
                                )
                              : null,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        authorName ?? "Dr Precious",
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: BoxBorder.all(width: 1, color: Colors.grey),
                    ),
                    child: const Text(
                      "Subscribe",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 10,
                        fontWeight: FontWeight.w300,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          Container(
            width: normalUse && tappedUpperCategory.contains('All topics')
                ? MediaQuery.of(context).size.width * 0.75
                : tappedUpperCategory.contains('All topics')
                ? MediaQuery.of(context).size.width * 0.92
                : MediaQuery.of(context).size.width * 1,
            height: tappedUpperCategory == "All topics" ? 150 : 200,
            padding: EdgeInsets.zero,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              color: tappedUpperCategory == "All topics"
                  ? blogProvider.getCategoryColor(category)
                  : const Color(0XFFE8DED1),
              borderRadius: tappedUpperCategory == "All topics"
                  ? BorderRadius.circular(15)
                  : BorderRadius.zero,
            ),
            child: GestureDetector(
              onTap: onPressed,
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 30, 20.0, 0),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 18),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              if (tappedUpperCategory == "All topics") ...[
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
                                      style: Theme.of(
                                        context,
                                      ).textTheme.bodyMedium,
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
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                  if (tappedUpperCategory == "All topics")
                    Positioned(
                      right: -250,
                      top: 0,
                      left: 0,
                      bottom: 0,
                      child: Image.asset(image),
                    )
                  else
                    Center(child: Image.asset(image)),
                ],
              ),
            ),
          ),
          tappedUpperCategory == "All topics"
              ? SizedBox.shrink()
              : AppThemeSpacing.smallSpacing,

          if (tappedUpperCategory != "All topics")
            SizedBox(
              width: MediaQuery.of(context).size.width,

              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 3, 12, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Flexible(
                          child: Text(
                            topic,
                            style: Theme.of(
                              context,
                            ).textTheme.headlineMedium?.copyWith(fontSize: 20),
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ),
                      ],
                    ),
                    AppThemeSpacing.mediumSpacing,
                    Row(
                      children: [
                        type.toLowerCase() == "article"
                            ? Icon(
                                LucideIcons.bookOpen,
                                size: 20,
                                weight: .2,
                                color: Colors.grey[900],
                              )
                            : Icon(
                                LucideIcons.video,
                                size: 20,
                                weight: 1.0,
                                color: Colors.grey[900],
                              ),
                        AppThemeSpacing.smallSpacing,
                        Text(
                          type.capitalize,
                          style: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(
                                color: Colors.grey[900],
                                fontWeight: FontWeight.w300,
                              ),
                        ),
                        Icon(LucideIcons.dot),
                        Text(
                          duration,
                          style: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(
                                color: Colors.grey[900],
                                fontWeight: FontWeight.w300,
                              ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          Divider(),
        ],
      ),
    );
  }
}

import 'package:be_calm/features/home/presentation/widgets/build_section.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:be_calm/shared/state/blog_provider.dart';
import 'package:be_calm/shared/utils/app_theme_colors.dart';
import 'package:be_calm/shared/utils/app_theme_spacing.dart';
import 'package:be_calm/features/home/presentation/widgets/categories_containers.dart';


class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final blogProvider = context.watch<BlogProvider>();
    final tappedUpperCategory = blogProvider.tapedCategory;
    final blogCategories = blogProvider.blog
        .map((item) => item.category)
        .toSet()
        .toList();

    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: Column(
          children: [
            SizedBox(
              height: 40,
              child: ListView.builder(
                padding: EdgeInsets.only(left: 12),
                scrollDirection: Axis.horizontal,
                itemCount: blogProvider.blogCategories.length,
                itemBuilder: (context, index) {
                  return CategoriesContainers(
                    category: blogProvider.blogCategories[index],
                    useAge: true,
                  );
                },
              ),
            ),
          ],
        ),
        backgroundColor: AppThemeColors.scafoldbackground,
      ),
      body: SingleChildScrollView(
        primary: false,
        child: Column(
          children: [
            if (blogProvider.blog.any((b) => b.isRecommended) &&
                tappedUpperCategory == 'All topics')
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(26, 12, 18, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppThemeSpacing.mediumSpacing,
                        Text(
                          "Recommended",
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                        AppThemeSpacing.smallSpacing,
                        Text(
                          "Other moms on day 9 saved this",
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      ],
                    ),
                  ),
                  BuildSection(
                    normalUse: false,
                    tappedUpperCategory: tappedUpperCategory,
                    selectedCategory: tappedUpperCategory,
                    category: "Recommended",
                    blogCategories: blogCategories,
                    blogs: blogProvider.blog.where((b) => b.isRecommended).toList(),
                  ),
                ],
              ),
            ...blogCategories
                .where(
                  (element) =>
                      tappedUpperCategory == "All topics" ||
                      element == tappedUpperCategory,
                )
                .map((cat) {
                  final blogs = blogProvider.getByCategory(cat);

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(26, 0, 18, 0),
                        child: tappedUpperCategory == "All topics"
                            ? Text(
                                cat,
                                style: Theme.of(
                                  context,
                                ).textTheme.headlineLarge,
                              )
                            : const SizedBox.shrink(),
                      ),

                      Padding(
                        padding: tappedUpperCategory == "All topics"
                            ? const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 12,
                              )
                            : const EdgeInsets.symmetric(
                                horizontal: 0,
                                vertical: 12,
                              ),
                        child: BuildSection(
                          normalUse: true,
                          tappedUpperCategory: tappedUpperCategory == "All topics"
                              ? tappedUpperCategory
                              : cat,
                          selectedCategory: tappedUpperCategory,
                          category: cat,
                          blogCategories: blogCategories,
                          blogs: blogs, 
                        ),
                      ),
                    ],
                  );
                }),
          ],
        ),
      ),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reads/models/blog.dart';
import 'package:reads/state/blog_provider.dart';
import 'package:reads/utils/app_theme_colors.dart';
import 'package:reads/utils/app_theme_fonts.dart';
import 'package:reads/utils/app_theme_spacing.dart';
import 'package:reads/widgets/categories.dart';
import 'package:reads/widgets/showcase_categories.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final blogProvider = context.watch<BlogProvider>();
    final tappedUpperCategory = blogProvider.tapedCategory;
    final blogCategories = blogProvider.blog
        .map((item) => item.category)
        .toSet();

    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: SizedBox(
          height: 40,
          child: ListView.builder(
            padding: EdgeInsets.only(left: 12),
            scrollDirection: Axis.horizontal,
            itemCount: blogProvider.blogCategories.length,
            itemBuilder: (context, index) {
              return Categories(category: blogProvider.blogCategories[index]);
            },
          ),
        ),
        backgroundColor: AppThemeColors.scafoldbackground,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            if (blogProvider.blog.any((b) => b.isRecommended) &&
                tappedUpperCategory == 'All topics')
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(26, 18, 18, 0),
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
                  _buildSection(
                    context,
                    blogProvider.blog.where((b) => b.isRecommended).toList(),
                    false,
                    tappedUpperCategory,
                    tappedUpperCategory,
                    "Recommended",
                    blogProvider,
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
                        padding: const EdgeInsets.fromLTRB(26, 18, 18, 0),
                        child: Text(
                          tappedUpperCategory == "All topics" ? cat : "",
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                      ),
                      _buildSection(
                        context,
                        blogs,
                        true,
                        tappedUpperCategory == "All topics"
                            ? tappedUpperCategory
                            : cat,
                        tappedUpperCategory,
                        cat,
                        blogProvider,
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

Widget _buildSection(
  BuildContext context,
  List<Blog> blogs,
  normalUse,
  tappedUpperCategory,
  selectedCategory,
  category,
  blog,
) {
  if (tappedUpperCategory == "All topics") {
    return SizedBox(
      height: tappedUpperCategory == "All topics"
          ? 202
          : MediaQuery.of(context).size.height,
      child: ListView.builder(
        scrollDirection: tappedUpperCategory == "All topics"
            ? Axis.horizontal
            : Axis.vertical,
        itemCount: blogs.length,
        itemBuilder: (context, index) {
          final blog = blogs[index];
          return Padding(
            padding: const EdgeInsets.fromLTRB(18.0, 8, 0, 0),
            child: ShowCase(
              topic: blog.title,
              duration: blog.duration,
              type: blog.type,
              normalUse: normalUse,
              tappedUpperCategory: tappedUpperCategory,
              category: category,
              blog: blog,
            ),
          );
        },
      ),
    );
  }

  return Padding(
    padding: const EdgeInsets.fromLTRB(18, 0, 18, 0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Text(selectedCategory, style: AppThemeFonts.headineLarge),
        ),
        AppThemeSpacing.mediumSpacing,
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: blogs.length,
          itemBuilder: (context, index) {
            final blog = blogs[index];
            return ShowCase(
              topic: blog.title,
              duration: blog.duration,
              tappedUpperCategory: selectedCategory,
              type: blog.type,
              normalUse: normalUse,
              category: category,
              blog: blog,
            );
          },
        ),
      ],
    ),
  );
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reads/models/blog.dart';
import 'package:reads/state/blog_provider.dart';
import 'package:reads/utils/app_theme_colors.dart';
import 'package:reads/utils/app_theme_spacing.dart';
import 'package:reads/widgets/categories.dart';
import 'package:reads/widgets/showcase_categories.dart';
import 'package:reads/widgets/showcase_recommended_categories.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final blogProvider = context.watch<BlogProvider>();
    final category = blogProvider.blog
        .map((item) => item.category)
        .toSet()
        .toList();
    print(category);
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
            if (blogProvider.blog.any((b) => b.isRecommended))
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
                          "Recommendeded",
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
                    blogProvider.blog.where((b) => b.isRecommended).toList(),
                  ),
                ],
              ),

            ...category.map((cat) {
              final blogs = blogProvider.getByCategory(cat);

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(26, 18, 18, 0),
                    child: Text(
                      cat,
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                  ),
                  _buildSection2(blogs),
                ],
              );
            }),
          ],
        ),
      ),
    );
  }
}

Widget _buildSection(List<Blog> blogs) {
  return SizedBox(
    height: 202,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: blogs.length,
      itemBuilder: (context, index) {
        final blog = blogs[index];
        return Padding(
          padding: const EdgeInsets.fromLTRB(8, 8, 0, 0),
          child: ShowcaseRecommendedCategories(
            topic: blog.title,
            duration: blog.duration,
            type: blog.type,
          ),
        );
      },
    ),
  );
}

Widget _buildSection2(List<Blog> blogs) {
  return SizedBox(
    height: 202,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: blogs.length,
      itemBuilder: (context, index) {
        final blog = blogs[index];
        return Padding(
          padding: const EdgeInsets.fromLTRB(18.0, 8, 0, 0),
          child: ShowCase(
            topic: blog.title,
            duration: blog.duration,
            type: blog.type,
          ),
        );
      },
    ),
  );
}

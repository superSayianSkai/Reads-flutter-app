import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:be_calm/models/blog.dart';
import 'package:be_calm/screens/blog_post.dart';
import 'package:be_calm/state/blog_provider.dart';
import 'package:be_calm/utils/app_theme_colors.dart';
import 'package:be_calm/utils/app_theme_fonts.dart';
import 'package:be_calm/utils/app_theme_spacing.dart';
import 'package:be_calm/widgets/categories_containers.dart';
import 'package:be_calm/widgets/showcase_categories.dart';
import 'package:be_calm/state/video_provider.dart';

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
        title: SizedBox(
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
                  _buildSection(
                    context,
                    blogProvider.blog.where((b) => b.isRecommended).toList(),
                    false,
                    tappedUpperCategory,
                    tappedUpperCategory,
                    "Recommended",
                    blogCategories,
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
                        blogCategories,
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
  blogCategories,
) {
  if (tappedUpperCategory == "All topics") {
    return SizedBox(
      height: tappedUpperCategory == "All topics"
          ? 202
          : MediaQuery.of(context).size.height,
      child: ListView.builder(
        padding: EdgeInsets.zero,
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
              image: blog.image,
              onPressed: () {
                if (blog.type == "video") {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ChangeNotifierProvider(
                        create: (_) => VideoProvider()..initialise(),
                        child: BlogPost(
                          picture: blog.picture,
                          image: blog.image,
                          type: blog.type,
                          topic: blog.title,
                          career: blog.occupation,
                          name: blog.authorsName,
                          content: blog.content,
                          date: blog.date,
                          categoryList: blogCategories,
                        ),
                      ),
                    ),
                  );
                } else {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => BlogPost(
                        picture: blog.picture,
                        image: blog.image,
                        type: blog.type,
                        topic: blog.title,
                        career: blog.occupation,
                        name: blog.authorsName,
                        content: blog.content,
                        date: blog.date,
                        categoryList: blogCategories,
                      ),
                    ),
                  );
                }
              },
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
          padding: EdgeInsets.zero,
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
              image: blog.image,
              onPressed: () {
                if (blog.type == "video") {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ChangeNotifierProvider(
                        create: (_) => VideoProvider()..initialise(),
                        child: BlogPost(
                          picture: blog.picture,
                          image: blog.image,
                          type: blog.type,
                          topic: blog.title,
                          career: blog.occupation,
                          name: blog.authorsName,
                          content: blog.content,
                          date: blog.date,
                          categoryList: blogCategories,
                        ),
                      ),
                    ),
                  );
                } else {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => BlogPost(
                        picture: blog.picture,
                        image: blog.image,
                        type: blog.type,
                        topic: blog.title,
                        career: blog.occupation,
                        name: blog.authorsName,
                        content: blog.content,
                        date: blog.date,
                        categoryList: blogCategories,
                      ),
                    ),
                  );
                }
              },
            );
          },
        ),
      ],
    ),
  );
}

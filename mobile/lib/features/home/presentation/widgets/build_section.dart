import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:be_calm/shared/models/blog.dart';
import 'package:be_calm/shared/screens/blog_post.dart';
import 'package:be_calm/shared/state/blog_provider.dart';
import 'package:be_calm/features/explore/presentations/widgets/showcase.dart';
import 'package:be_calm/shared/state/video_provider.dart';

class BuildSection extends StatelessWidget {
  final bool normalUse;
  final String tappedUpperCategory;
  final String selectedCategory;
  final String category;
  final List<String> blogCategories;
  final List<Blog> blogs;
  const BuildSection({
    super.key,
    this.normalUse = true,
    required this.tappedUpperCategory,
    required this.selectedCategory,
    required this.category,
    required this.blogCategories,
    required this.blogs,
  });
  @override
  Widget build(BuildContext context) {
    final blogProvider = context.watch<BlogProvider>();

    final tappedUpperCategory = blogProvider.tapedCategory;

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
      padding: tappedUpperCategory == "All topics"
          ? EdgeInsets.symmetric(horizontal: 10)
          : EdgeInsets.symmetric(horizontal: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
                image: blog.image,
                authorName: blog.authorsName,
                authorPic: blog.picture,
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
}

import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:provider/provider.dart';
import 'package:reads/state/blog_provider.dart';
import 'package:reads/utils/app_theme_colors.dart';
import 'package:reads/utils/app_theme_spacing.dart';
import 'package:reads/utils/string_extension.dart';
import 'package:reads/widgets/categories_containers.dart';

class BlogPost extends StatelessWidget {
  final String picture;
  final String type;
  final String topic;
  final String career;
  final String name;
  final String content;
  final String date;
  final List<String> categoryList;

  const BlogPost({
    super.key,
    required this.picture,
    required this.type,
    required this.topic,
    required this.career,
    required this.name,
    required this.content,
    required this.date,
    required this.categoryList,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.only(left: 2.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(LucideIcons.arrowLeft, size: 25),
                  ),
                  AppThemeSpacing.largeSpacing,
                  AppThemeSpacing.mediumSpacing,
                  Text(
                    type.capitalize,
                    style: Theme.of(
                      context,
                    ).textTheme.bodyLarge?.copyWith(fontSize: 20),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppThemeSpacing.smallSpacing,
                  Icon(LucideIcons.bookmark, size: 20),
                ],
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 190,
                decoration: BoxDecoration(
                  color: AppThemeColors.bodyandRecoveryCard,
                  image: DecorationImage(
                    image: AssetImage(picture),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              AppThemeSpacing.largeSpacing,
              AppThemeSpacing.largeSpacing,
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    topic,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontSize: 25,
                      fontWeight: FontWeight(800),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Center(
                child: Text(
                  date,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
              AppThemeSpacing.largeSpacing,
              SizedBox(
                height: 40,
                child: ListView.builder(
                  padding: EdgeInsets.only(left: 12),
                  scrollDirection: Axis.horizontal,
                  itemCount: categoryList.length,
                  itemBuilder: (context, index) {
                    return CategoriesContainers(
                      category: categoryList[index],
                      useAge: false,
                      onPressed: () {
                        context.read<BlogProvider>().getTapedCategory(
                          categoryList[index],
                        );
                        Navigator.of(context).pop();
                      },
                    );
                  },
                ),
              ),
              AppThemeSpacing.largeSpacing,
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            image: DecorationImage(
                              image: AssetImage(
                                'assets/images/doctor-lady.jpeg',
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        AppThemeSpacing.smallSpacing,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(career, textAlign: TextAlign.start),

                                Image.asset(
                                  "assets/icons/check.png",
                                  width: 20,
                                ),
                              ],
                            ),
                            Text(name),
                          ],
                        ),
                      ],
                    ),

                    Container(
                      padding: EdgeInsets.fromLTRB(12, 2, 12, 2),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Text(
                        "Subscribe",
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  content,
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(fontSize: 16),
                ),
              ),
              AppThemeSpacing.largeSpacing,
              Divider(thickness: 1),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Center(
                  child: SizedBox(
                    height: 30,
                    child: Text("Reviewed by Dr. Precious Daniels"),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

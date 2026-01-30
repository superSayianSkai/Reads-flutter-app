import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reads/state/blog_provider.dart';
import 'package:reads/utils/app_theme_colors.dart';
import 'package:reads/widgets/categories.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final blogProvider = context.read<BlogProvider>();
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
      body: SafeArea(child: 
      Column(
        children: [],
      )),
    );
  }
}

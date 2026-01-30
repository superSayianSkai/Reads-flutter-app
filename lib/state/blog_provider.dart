import 'package:flutter/material.dart';
import 'package:reads/models/article.dart';
import 'package:reads/service/article.dart';

class BlogProvider extends ChangeNotifier {
  List<Blog> _blogs = [];
  List<String> _blogCategories = [];

  List<String> get blogCategories => _blogCategories;

  BlogProvider() {
    _loadBlogsCategories();
  }

  void _loadBlogsCategories() {
    _blogs = fakeBlogData.map((json) => Blog.fromJson(json)).toList();
    _blogCategories = [
      "All topics",
      ..._blogs.map((item) => item.category).toSet(),
    ];
    notifyListeners();
  }
}

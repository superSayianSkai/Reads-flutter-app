import 'package:flutter/material.dart';
import 'package:be_calm/models/blog.dart';
import 'package:be_calm/service/fake_blog_data.dart';
import 'package:be_calm/utils/app_theme_colors.dart';

class BlogProvider extends ChangeNotifier {
  List<Blog> _blogs = [];
  List<String> _blogCategories = [];
  List<String> _blogTitle = [];
  List<String> _blogDuration = [];
  List<String> _blogType = [];
  List<bool> _isRecommended = [];
  String _tapedCategory = "All topics";

  List<String> get blogCategories => _blogCategories;
  List<Blog> get blog => _blogs;
  List<String> get blogtitle => _blogTitle;
  List<String> get blogDuration => _blogDuration;
  List<String> get blogType => _blogType;
  List<bool> get isRecommended => _isRecommended;
  String get tapedCategory => _tapedCategory;

  BlogProvider() {
    _blogs = fakeBlogData.map((json) => Blog.fromJson(json)).toList();
    _loadBlogsCategories();
    _loadTitle();
    _loadDuration();
    _loadType();
    _loadIsRecommended();
  }

  void _loadBlogsCategories() {
    _blogCategories = [
      "All topics",
      ..._blogs.map((item) => item.category).toSet(),
    ];
    notifyListeners();
  }

  void _loadTitle() {
    _blogTitle = _blogs.map((item) => item.title).toList();
  }

  void _loadDuration() {
    _blogDuration = _blogs.map((item) => item.duration).toList();
  }

  void _loadType() {
    _blogType = _blogs.map((item) => item.type).toList();
  }

  void _loadIsRecommended() {
    _isRecommended = _blogs.map((item) => item.isRecommended).toList();
  }

  List<Blog> getByCategory(String category) {
    return _blogs.where((element) => element.category == category).toList();
  }

  void getTapedCategory(String category) {
    _tapedCategory = category;
    notifyListeners();
  }

  //
  Color getCategoryColor(String category) {
    switch (category) {
      case 'Body & Recovery':
        return AppThemeColors.bodyandRecoveryCard;
      case 'Self-care':
        return AppThemeColors.selfCareCard;
      case "Mind and mood":
        return AppThemeColors.mindAndMood;
      case 'Cultural care':
        return AppThemeColors.culturalCase;
      case 'Baby care':
        return AppThemeColors.babyCare;
    }
    return AppThemeColors.defaultColor;
  }
}

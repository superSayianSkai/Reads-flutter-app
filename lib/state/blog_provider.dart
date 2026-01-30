

import 'package:flutter/material.dart';
import 'package:reads/models/blog.dart';
import 'package:reads/service/fakeBlogData.dart';

class BlogProvider extends ChangeNotifier {
  List<Blog> _blogs = [];
  List<String> _blogCategories = [];
  List<String> _blogTitle = [];
  List<String> _blogDuration = [];
  List<String> _blogType = [];
  List<bool> _isRecommended = [];

  List<String> get blogCategories => _blogCategories;
  List<Blog> get blog => _blogs;
  List<String> get blogtitle => _blogTitle;
  List<String> get blogDuration => _blogDuration;
  List<String> get blogType => _blogType;
  List<bool> get isRecommended => _isRecommended;

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
}

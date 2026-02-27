import 'package:be_calm/shared/models/blog.dart';
import 'package:be_calm/features/explore/model/search_carousel.dart';
import 'package:be_calm/features/explore/data/search_blog_carousel_data.dart';
import 'package:be_calm/features/explore/data/search_top_blog.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class SearchProvider extends ChangeNotifier {
  List<SearchCarousel> _searchCarouselData = [];
  List<Blog> _searchTopPost = [];
  List<SearchCarousel> get searchCarouselData => _searchCarouselData;
  final PageController _pagecontroller = PageController();
  int _currentIndex = 0;
  bool _isForward = false;
  Timer? _timer;

  List<Blog> get searchBarTopPost => _searchTopPost;
  PageController get pagecontroller => _pagecontroller;
  void get startAutoScroll => _startAutoScroll;
  int get currentIndex =>_currentIndex;
 

  SearchProvider() {
    _startAutoScroll();
    _loadData();
  }

  void _loadData() {
    _searchCarouselData = searchBlogCarouselData
        .map((json) => SearchCarousel.fromJson(json))
        .toList();
    _searchTopPost = searchTopBlog.map((json) => Blog.fromJson(json)).toList();
  }

  void _startAutoScroll() {
    _timer = Timer.periodic(Duration(seconds: 3), (timer) {
      if (!_pagecontroller.hasClients || searchCarouselData.isEmpty) return;

      if (_currentIndex >= _searchCarouselData.length - 1) {
        _isForward = false;
      } else if (_currentIndex <= 0) {
        _isForward = true;
      }

      _currentIndex = _isForward ? _currentIndex + 1 : _currentIndex - 1;

      _pagecontroller.animateToPage(
        _currentIndex,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      notifyListeners();
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pagecontroller.dispose();
    super.dispose();
  }
}

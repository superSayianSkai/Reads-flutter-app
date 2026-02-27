import 'package:be_calm/models/blog.dart';
import 'package:be_calm/models/search_carousel.dart';
import 'package:be_calm/service/search_blog_carousel_data.dart';
import 'package:be_calm/service/search_top_blog.dart';
import 'package:flutter/material.dart';

class SearchProvider extends ChangeNotifier {
  List<SearchCarousel> _searchCarouselData = [];
  List<Blog> _searchTopPost = [];
  // final List<String> _searchCarouselAuthorNames = [];
  // final List<String> _searchCarouselTitle = [];

  List<SearchCarousel> get searchCarouselData => _searchCarouselData;
  List<Blog> get searchBarTopPost => _searchTopPost;

  SearchProvider() {
    _searchCarouselData = searchBlogCarouselData
        .map((json) => SearchCarousel.fromJson(json))
        .toList();
    _searchTopPost = searchTopBlog.map((json) => Blog.fromJson(json)).toList();
  }
}

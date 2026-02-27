import 'package:be_calm/features/home/presentation/widgets/home.dart';
import 'package:be_calm/features/notification/notification.dart';
import 'package:be_calm/features/post/post.dart';
import 'package:be_calm/features/explore/presentations/screens/search.dart';
import 'package:be_calm/features/user/user.dart';
import 'package:flutter/material.dart';

class HomeScreenShellProvider extends ChangeNotifier {
  int _currentIndex = 0;
  final List<Widget> _screen = [Home(), Search(), Post(), Notif(), User()];

  int get currentIndex => _currentIndex;
  List<Widget> get screen => _screen;

  void updateIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}

import 'package:be_calm/screens/home.dart';
import 'package:be_calm/screens/notification.dart';
import 'package:be_calm/screens/post.dart';
import 'package:be_calm/screens/search.dart';
import 'package:be_calm/screens/user.dart';
import 'package:flutter/material.dart';

class ScreenShellProvider extends ChangeNotifier {
  int _currentIndex = 0;
  final List<Widget> _screen = [Home(), Search(), Post(), Notif(), User()];

  int get currentIndex => _currentIndex;
  List<Widget> get screen => _screen;

  void updateIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}

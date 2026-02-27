import 'package:be_calm/service/onboarding_data.dart';
import 'package:be_calm/widgets/onboarding_page.dart';
import 'package:flutter/widgets.dart';

class OnboardingScreenProvider extends ChangeNotifier {
  final PageController _controller = PageController();
  int _currentPage = 0;
  List<OnboardingPage> _onBoardingData = [];

  int get currentPage => _currentPage;
  PageController get controller => _controller;
  List<OnboardingPage> get onBoardingData => _onBoardingData;

  OnboardingScreenProvider() {
    _onBoardingData = onBoardingPageData.map((data) {
      return OnboardingPage(
        words: data.words,
        imagePath: data.imagePath,
        page: data.page,
      );
    }).toList();
  }

  void getPageIndex(int index) {
    _currentPage = index;
    notifyListeners();
  }
}

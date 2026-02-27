import 'package:be_calm/state/onBoarding_screen_provider.dart';
import 'package:be_calm/utils/app_theme_colors.dart';
import 'package:be_calm/utils/app_theme_spacing.dart';
import 'package:be_calm/widgets/my_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OnboardingScreens extends StatelessWidget {
  const OnboardingScreens({super.key});
  
  @override
  Widget build(BuildContext context) {
    final onboardingPageProvider = context.watch<OnboardingScreenProvider>();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: onboardingPageProvider.controller,
            onPageChanged: (index) {
              onboardingPageProvider.getPageIndex(index);
            },
            children: onboardingPageProvider.onBoardingData,
          ),

          Positioned(
            bottom: 60,
            left: 0,
            right: 0,
            child:
                onboardingPageProvider.currentPage ==
                    onboardingPageProvider.onBoardingData.length - 1
                ? Container(
                    height: 450,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(18.0, 50, 20, 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(
                                "Your All Access Pass to a Good Health",
                                style: Theme.of(context).textTheme.displaySmall
                                    ?.copyWith(fontWeight: FontWeight.w600),
                              ),

                              AppThemeSpacing.largeSpacing,
                              Text(
                                "Your health is our top priority, and that’s exactly why beCalm is committed to providing you with high-quality, trusted, and accredited blogs. Every piece of content is carefully curated and reviewed to ensure it’s accurate, reliable, and genuinely helpful so you can make informed decisions about your health with confidence. With BeCalm, you’re not just reading blogs, you’re gaining credible knowledge designed to support your well-being every step of the way.",
                                style: Theme.of(context).textTheme.bodyMedium
                                    ?.copyWith(fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),

                          MyButton(
                            text: "Click to Continue",
                            routeName: "home",
                          ),
                        ],
                      ),
                    ),
                  )
                : Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        onboardingPageProvider.onBoardingData.length - 1,
                        (index) => Container(
                          width: onboardingPageProvider.currentPage == index
                              ? 34
                              : 15,
                          height: 15,
                          margin: const EdgeInsets.symmetric(horizontal: 6),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: onboardingPageProvider.currentPage == index
                                ? AppThemeColors.buttonColorActive
                                : AppThemeColors.bodyandRecoveryCard,
                          ),
                        ),
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}

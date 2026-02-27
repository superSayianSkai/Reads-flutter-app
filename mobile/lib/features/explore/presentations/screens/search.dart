import 'package:be_calm/features/explore/state/search_carousel_provider.dart';
import 'package:be_calm/shared/utils/app_theme_colors.dart';
import 'package:be_calm/shared/utils/app_theme_fonts.dart';
import 'package:be_calm/shared/utils/app_theme_spacing.dart';
import 'package:be_calm/features/explore/presentations/widgets/showcase.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:provider/provider.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    final searchCarouselDataInstance = context.watch<SearchProvider>();
    final searchCarouselProcessedData =
        searchCarouselDataInstance.searchCarouselData;
    final searchTopPostProcessedData =
        searchCarouselDataInstance.searchBarTopPost;
    final currentIndex = searchCarouselDataInstance.currentIndex;

    return Scaffold(
      appBar: AppBar(
        leadingWidth: double.infinity,
        toolbarHeight: 70,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(LucideIcons.search),
              contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 2),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
              ),
              hintText: "Search for blogs....",
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        primary: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 350,
              width: double.infinity,
              child: PageView.builder(
                controller: searchCarouselDataInstance.pagecontroller,
                itemCount: searchCarouselProcessedData.length,
                itemBuilder: (context, index) {
                  final searchCarouselImages =
                      searchCarouselProcessedData[index].picture;
                  final searchCarouseleAuthorsName =
                      searchCarouselProcessedData[index].authorName;
                  final searchCarouselTitle =
                      searchCarouselProcessedData[index].title;
                  return Stack(
                    children: [
                      Image.asset(
                        searchCarouselImages,
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover,
                      ),

                      Positioned(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.black.withValues(alpha: .3),
                          ),
                        ),
                      ),

                      Positioned(
                        bottom: 0,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16.0,
                            vertical: 10,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                searchCarouseleAuthorsName,
                                style: AppThemeFonts.headlineMedium.copyWith(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                              Text(
                                searchCarouselTitle,
                                style: AppThemeFonts.headineLarge.copyWith(
                                  color: Colors.white,
                                  fontSize: 25,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            AppThemeSpacing.smallSpacing,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                searchCarouselProcessedData.length,
                (index) => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  width: 8,
                  height: 8,
                  margin: const EdgeInsets.symmetric(horizontal: 2),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: currentIndex == index ? AppThemeColors.black: AppThemeColors.buttonBorderColor,
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 0.0,
                vertical: 10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppThemeSpacing.largeSpacing,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 22.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Top Blogs",
                          textAlign: TextAlign.start,
                          style: AppThemeFonts.headlineSmall.copyWith(
                            color: Colors.grey,
                          ),
                        ),
                        Text(
                          "Medical stuff you might like",
                          textAlign: TextAlign.center,
                          style: AppThemeFonts.headineLarge,
                        ),
                      ],
                    ),
                  ),

                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: searchTopPostProcessedData.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final searchTopPost = searchTopPostProcessedData[index];
                      return ShowCase(
                        topic: searchTopPost.title,
                        duration: searchTopPost.duration,
                        type: searchTopPost.type,
                        normalUse: true,
                        category: searchTopPost.category,
                        tappedUpperCategory: searchTopPost.category,
                        authorName: searchTopPost.authorsName,
                        authorPic: searchTopPost.picture,
                        image: searchTopPost.image,
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

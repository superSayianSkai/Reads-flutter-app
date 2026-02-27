import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OnboardingPage extends StatelessWidget {
  final String words;
  final int? page;
  final String? imagePath;

  const OnboardingPage({
    super.key,
    required this.words,
    this.page,
    this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: page == 3 ? 0 : 42),
          child: Column(
            children: [
              Expanded(
                flex: page == 3 ? 30 : 3,
                child: page == 3
                    ? Image.asset(
                        'assets/onboarding/wears.gif',
                        width: double.infinity,
                        fit: BoxFit.cover,
                      )
                    : const SizedBox(height: 2),
              ),
              Expanded(
                flex: 3,
                child: Center(
                  child: imagePath != null
                      ? Image.asset(
                          imagePath!,
                          width: double.infinity,
                          fit: BoxFit.contain,
                        )
                      : const SizedBox.shrink(),
                ),
              ),

              Expanded(
                flex: page == 3 ? 25 : 4,
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.all(page == 3 ? 22 : 14),
                    child: Text(
                      words,
                      textAlign: TextAlign.center,
                      style: Theme.of(
                        context,
                      ).textTheme.headlineSmall?.copyWith(fontSize: 19),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:be_calm/state/screen_shell_provider.dart';
import 'package:be_calm/utils/app_theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:provider/provider.dart';

class ScreenShell extends StatelessWidget {
  const ScreenShell({super.key});

  @override
  Widget build(BuildContext context) {
    final screenShellProvider = context.watch<ScreenShellProvider>();
    return Scaffold(
      body: IndexedStack(
        index: screenShellProvider.currentIndex,
        children: screenShellProvider.screen,
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        iconSize: 24,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: screenShellProvider.currentIndex,
        onTap: (index) => screenShellProvider.updateIndex(index),
        items: [
          BottomNavigationBarItem(icon: Icon(LucideIcons.home), label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(LucideIcons.search),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: Container(
              height: 48,
              width: 48,
              decoration: BoxDecoration(
                color: AppThemeColors.buttonColorActive,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: AppThemeColors.buttonColorActive.withValues(
                      alpha: 0.3,
                    ),
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Icon(LucideIcons.plus, color: Colors.white),
            ),
            label: "Post",
          ),
          BottomNavigationBarItem(
            icon: Icon(LucideIcons.messageCircle),
            label: "message",
          ),
          BottomNavigationBarItem(
            icon: Icon(LucideIcons.userCircle),
            label: "user",
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class ReusableTabBar extends StatelessWidget {
  final List<Tab> tabs;
  final TabController tabController;
  final bool isDarkMode;

  const ReusableTabBar({
    super.key,
    required this.tabs,
    required this.tabController,
    this.isDarkMode = false,
  });

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: tabController,
      tabs: tabs,
      indicatorColor: isDarkMode ? Colors.white : Colors.black,
      labelColor: isDarkMode ? Colors.white : Colors.black,
      unselectedLabelColor: isDarkMode ? Colors.white54 : Colors.black54,
    );
  }
}
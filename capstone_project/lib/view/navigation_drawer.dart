import 'package:flutter/material.dart';

class NavigationDrawerCustom extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onDestinationSelected;

  const NavigationDrawerCustom({
    super.key,
    required this.selectedIndex,
    required this.onDestinationSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 240,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Logo + App Name
          
          const SizedBox(height: 8),

          // Menu items
          _buildNavItem(Icons.dashboard, "Dashboard", 0),
          _buildNavItem(Icons.book, "My Courses", 1),
          _buildNavItem(Icons.all_inclusive, "All Courses", 2),
          _buildNavItem(Icons.emoji_events, "Achievements", 3),
          _buildNavItem(Icons.leaderboard, "Leaderboard", 4),
          _buildNavItem(Icons.settings, "Settings", 5),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String title, int index) {
    bool isActive = selectedIndex == index;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Container(
        decoration: BoxDecoration(
          color: isActive ? Colors.blue.withOpacity(0.1) : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: ListTile(
          leading: Icon(
            icon,
            color: isActive ? Colors.blue : Colors.black54,
          ),
          title: Text(
            title,
            style: TextStyle(
              color: isActive ? Colors.blue : Colors.black87,
              fontWeight: isActive ? FontWeight.w600 : FontWeight.w400,
            ),
          ),
          onTap: () => onDestinationSelected(index),
        ),
      ),
    );
  }
}
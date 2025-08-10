import 'package:capstone_project/view/navigation_drawer.dart';
import 'package:flutter/material.dart';

import '../placeholder.dart';
import 'dashboard_page.dart';

class ResponsiveLayout extends StatefulWidget {
  const ResponsiveLayout({super.key});

  @override
  State<ResponsiveLayout> createState() => _ResponsiveLayoutState();
}

class _ResponsiveLayoutState extends State<ResponsiveLayout> {
  int selectedIndex = 0;
  final TextEditingController _searchController = TextEditingController();
  bool _isSearching = false;

  final List<Widget> _pages = const [
    DashboardPage(),
    PlaceholderPage(title: 'My Courses'),
    PlaceholderPage(title: 'All Courses'),
    PlaceholderPage(title: 'Achievements'),
    PlaceholderPage(title: 'Leaderboard'),
    PlaceholderPage(title: 'Settings'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isDesktop = constraints.maxWidth >= 800;
        if (isDesktop) {
          // Desktop View
          return Scaffold(
            body: Column(
              children: [
                // Top AppBar for Desktop
                Container(
                  height: 60,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(bottom: BorderSide(color: Colors.grey.shade300)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Logo and name
                      Row(
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 10, 2, 160),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Icon(Icons.school, color: Colors.white),
                          ),
                          const SizedBox(width: 8),
                          const Text(
                            "LearnHub",
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(width: 50),
                          // Search Field for Desktop
                          SizedBox(
                            width: 300,
                            child: TextField(
                              controller: _searchController,
                              decoration: InputDecoration(
                                hintText: "What do you want to learn?",
                                hintStyle: TextStyle(color: Colors.grey.shade600),
                                contentPadding:
                                    const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide(color: Colors.grey.shade300),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide(color: Colors.grey.shade300),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide:
                                      BorderSide(color: Theme.of(context).primaryColor),
                                ),
                                suffixIcon: Container(
                                  margin: const EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).primaryColor,
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: IconButton(
                                    icon: const Icon(Icons.search, color: Colors.white),
                                    onPressed: () {
                                      // Trigger search
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      // Actions
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.notifications_outlined, size: 24),
                            onPressed: () {},
                          ),
                          const SizedBox(width: 12),
                          const CircleAvatar(
                            radius: 18,
                            backgroundImage:
                                NetworkImage("https://htmlstream.com/preview/unify-v2.6.2/assets/img-temp/400x450/img5.jpg"),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // Body
                Expanded(
                  child: Row(
                    children: [
                      NavigationDrawerCustom(
                        selectedIndex: selectedIndex,
                        onDestinationSelected: _onItemTapped,
                      ),
                      Expanded(child: _pages[selectedIndex]),
                    ],
                  ),
                ),
              ],
            ),
          );
        } else {
          // Mobile View with animated search in AppBar
          return Scaffold(
            appBar: AppBar(
              title: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return SizeTransition(
                    sizeFactor: animation,
                    axis: Axis.horizontal,
                    child: child,
                  );
                },
                child: _isSearching
                    ? Container(
                        key: const ValueKey("searchField"),
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: TextField(
                          controller: _searchController,
                          autofocus: true,
                          decoration: InputDecoration(
                            hintText: "What do you want to learn?",
                            hintStyle: TextStyle(color: Colors.grey.shade600),
                            border: InputBorder.none,
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 16),
                            suffixIcon: IconButton(
                              icon: const Icon(Icons.search, color: Colors.blue),
                              onPressed: () {
                                // Trigger search
                              },
                            ),
                          ),
                          onSubmitted: (value) {
                            setState(() => _isSearching = false);
                          },
                        ),
                      )
                    : Row(
                        key: const ValueKey("titleRow"),
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: Colors.purple,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Icon(Icons.school, color: Colors.white),
                          ),
                          const SizedBox(width: 8),
                          const Text(
                            "LearnHub",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
              ),
              backgroundColor: Theme.of(context).primaryColor,
              foregroundColor: Colors.white,
              actions: [
                IconButton(
                  icon: Icon(
                    _isSearching ? Icons.close : Icons.search,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    setState(() {
                      if (_isSearching) {
                        _searchController.clear();
                      }
                      _isSearching = !_isSearching;
                    });
                  },
                ),
                IconButton(
                  icon:
                      const Icon(Icons.notifications_outlined, color: Colors.white),
                  onPressed: () {},
                ),
                const SizedBox(width: 4),
                const CircleAvatar(
                  radius: 16,
                  backgroundImage:
                      NetworkImage("https://via.placeholder.com/150"),
                ),
                const SizedBox(width: 12),
              ],
            ),
            body: _pages[selectedIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: selectedIndex,
              onTap: _onItemTapped,
              selectedItemColor: Theme.of(context).primaryColor,
              unselectedItemColor: Colors.grey,
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.dashboard), label: 'Dashboard'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.book), label: 'My Courses'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.all_inclusive), label: 'All Courses'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.emoji_events), label: 'Achievements'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.leaderboard), label: 'Leaderboard'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.settings), label: 'Settings'),
              ],
            ),
          );
        }
      },
    );
  }
}

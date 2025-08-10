import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Welcome back, Alex!",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          const Text("Ready to continue your learning journey?"),
          const SizedBox(height: 16),

          // Top Stats Row
          _statsSection(context),

          const SizedBox(height: 24),
          const Text(
            "My Courses Progress",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),

         _buildProgressCard(
  "JavaScript Fundamentals",
  "12 of 20 lessons completed",
  0.60,
  Colors.blue,
  Icons.code,
),
_buildProgressCard(
  "UI/UX Design Basics",
  "8 of 15 lessons completed",
  0.53,
  Colors.green,
  Icons.design_services,
),
_buildProgressCard(
  "Database Management",
  "18 of 18 lessons completed",
  1.0,
  Colors.purple,
  Icons.storage,
),

          const SizedBox(height: 24),
          const Text(
            "Recent Badges",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          _badgesSection(context),



          const SizedBox(height: 24),
          const Text(
            "Leaderboard",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Column(
  children: [
    _leaderboardItem(rank: 1, name: "Sarah Chen", points: 3240, rankColor: Colors.yellow, avatarUrl: null),
    _leaderboardItem(rank: 2, name: "Mike Johnson", points: 2980, rankColor: Colors.grey, avatarUrl: "https://via.placeholder.com/150"),
    _leaderboardItem(rank: 3, name: "You", points: 2840, rankColor: Colors.orange, avatarUrl: "https://via.placeholder.com/150"),
  ],
),


          const SizedBox(height: 24),
          const Text(
            "Explore New Courses",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          _exploreCoursesSection(),
        ],
      ),
    );
  }

  Widget _badgesSection(BuildContext context) {
  bool isWide = MediaQuery.of(context).size.width >= 800;

  if (isWide) {
    // Desktop / Large screens → normal row layout
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _badge("First Course", Colors.amber, Icons.emoji_events),
        _badge("Quick Learner", Colors.blue, Icons.emoji_events_outlined),
        _badge("15 Day Streak", Colors.green, Icons.local_fire_department),
        _badge("Top Performer", Colors.purple, Icons.star),
      ],
    );
  } else {
    // Mobile / Tablet → horizontal scroll
    return SizedBox(
      height: 160, // adjust height for badges
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _badge("First Course", Colors.amber, Icons.emoji_events),
          _badge("Quick Learner", Colors.blue, Icons.emoji_events_outlined),
          _badge("15 Day Streak", Colors.green, Icons.local_fire_department),
          _badge("Top Performer", Colors.purple, Icons.star),
        ].map((badge) => Padding(
          padding: const EdgeInsets.only(right: 12),
          child: badge,
        )).toList(),
      ),
    );
  }
}

  Widget _statsSection(BuildContext context) {
  bool isWide = MediaQuery.of(context).size.width >= 800;

  if (isWide) {
    // Desktop / Large Screens → Show in a row
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        _buildStatCard("Courses Enrolled", "12", Colors.blue),
        const SizedBox(width: 16),
        _buildStatCard("Completed", "8", Colors.green),
        const SizedBox(width: 16),
        _buildStatCard("Total Points", "2,840 XP", Colors.purple),
        const SizedBox(width: 16),
        _buildStatCard("Streak Days", "15", Colors.orange),
      ],
    );
  } else {
    // Mobile / Tablet → Scrollable horizontally
    return SizedBox(
      height: 120,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _buildStatCard("Courses Enrolled", "12", Colors.blue),
          _buildStatCard("Completed", "8", Colors.green),
          _buildStatCard("Total Points", "2,840 XP", Colors.purple),
          _buildStatCard("Streak Days", "15", Colors.orange),
        ].map((card) => Padding(padding: const EdgeInsets.only(right: 16), child: card)).toList(),
      ),
    );
  }
}

  Widget _exploreCoursesSection() {
  return SizedBox(
    height: 300,
    child: ListView(
      scrollDirection: Axis.horizontal,
      children: [
        _courseCard(
          imageUrl: "https://talent500.com/blog/wp-content/uploads/sites/42/2024/05/react-must-be-in-scope-when-using-jsx-scaled-1.jpg",
          category: "Web Development",
          rating: 4.8,
          title: "Advanced React Development",
          description: "Master modern React patterns and build scalable applications",
          price: "\$89",
        ),
        _courseCard(
          imageUrl: "https://www.mygreatlearning.com/blog/wp-content/uploads/2019/09/What-is-data-science-2.jpg",
          category: "Data Science",
          rating: 4.9,
          title: "Python for Data Analysis",
          description: "Analyze and visualize data using Python libraries",
          price: "\$129",
        ),
        _courseCard(
          imageUrl: "https://api.reliasoftware.com/uploads/ux_ui_design_322afd6292.webp",
          category: "Design",
          rating: 4.7,
          title: "Mobile App Design Mastery",
          description: "Create intuitive and engaging mobile app designs",
          price: "\$99",
        ),
      ].map((card) => Padding(
        padding: const EdgeInsets.only(right: 16),
        child: card,
      )).toList(),
    ),
  );
}



  static Widget _buildStatCard(String title, String value, Color color) {
    return Container(
      width: 180,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(value, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
          const SizedBox(height: 4),
          Text(title, style: const TextStyle(color: Colors.white)),
        ],
      ),
    );
  }

 static Widget _buildProgressCard(
    String title, String subtitle, double progress, Color color, IconData icon) {
  return Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color: Colors.grey.shade200),
      boxShadow: [
        BoxShadow(
          color: Colors.black12.withOpacity(0.05),
          blurRadius: 6,
          offset: const Offset(0, 3),
        )
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Icon box
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(icon, color: color, size: 20),
            ),
            const SizedBox(width: 12),

            // Title & Subtitle
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),

            // Percentage
            Text(
              "${(progress * 100).toStringAsFixed(0)}%",
              style: TextStyle(
                color: color,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),

        const SizedBox(height: 10),

        // Progress Bar
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: LinearProgressIndicator(
            value: progress,
            color: color,
            backgroundColor: Colors.grey.shade300,
            minHeight: 6,
          ),
        ),
      ],
    ),
  );
}


 static Widget _badge(String title, Color color, IconData icon) {
  return Container(
    width: 150, // adjust width
    padding: const EdgeInsets.symmetric(vertical: 20),
    decoration: BoxDecoration(
      color: color.withOpacity(0.15),
      borderRadius: BorderRadius.circular(12),
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(
          radius: 24,
          backgroundColor: color,
          child: Icon(icon, color: Colors.white, size: 28),
        ),
        const SizedBox(height: 8),
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    ),
  );
}

 static Widget _leaderboardItem({
  required int rank,
  required String name,
  required int points,
  required Color rankColor,
  String? avatarUrl,
}) {
  return Container(
    width: 400,
    margin: const EdgeInsets.symmetric(vertical: 6),
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(
      color: rankColor.withOpacity(0.08),
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color: rankColor.withOpacity(0.4), width: 1),
    ),
    child: Row(
      children: [
        // Rank Circle
        CircleAvatar(
          radius: 14,
          backgroundColor: rankColor,
          child: Text(
            rank.toString(),
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(width: 12),

        // Avatar
        if (avatarUrl != null)
          CircleAvatar(
            radius: 18,
            backgroundImage: NetworkImage(avatarUrl),
          )
        else
          const CircleAvatar(
            radius: 18,
            backgroundColor: Colors.grey,
            child: Icon(Icons.person, color: Colors.white),
          ),

        const SizedBox(width: 12),

        // Name & Points
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                "$points pts",
                style: const TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}


static Widget _courseCard({
  required String imageUrl,
  required String category,
  required double rating,
  required String title,
  required String description,
  required String price,
}) {
  return Container(
    width: 260,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.15),
          blurRadius: 8,
          spreadRadius: 2,
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
          child: Image.network(
            imageUrl,
            height: 140,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.blue.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      category,
                      style: const TextStyle(fontSize: 12, color: Colors.blue),
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Icon(Icons.star, color: Colors.amber, size: 16),
                  Text(
                    rating.toString(),
                    style: const TextStyle(fontSize: 12),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                title,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 4),
              Text(
                description,
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    price,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.blue,
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text(
                      "Enroll Now",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}


}
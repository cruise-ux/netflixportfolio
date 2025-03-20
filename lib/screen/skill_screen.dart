import 'package:flutter/material.dart';

class SkillsScreen extends StatelessWidget {
  final List<Map<String, dynamic>> skills = [
    {"name": "Flutter", "icon": Icons.flutter_dash, "color": Colors.blue},
    {"name": "Dart", "icon": Icons.code, "color": Colors.blueAccent},
    {"name": "Firebase", "icon": Icons.cloud, "color": Colors.orange},
    {"name": "UI/UX", "icon": Icons.design_services, "color": Colors.purple},
    {"name": "GetX", "icon": Icons.flash_on, "color": Colors.teal},
    {"name": "API Integration", "icon": Icons.api, "color": Colors.green},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 34, 33, 33),
      appBar: AppBar(
        title: const Text("For you", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Adjust for responsiveness
            childAspectRatio: 1.2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
          ),
          itemCount: skills.length,
          itemBuilder: (context, index) {
            return SkillCard(
              skillName: skills[index]["name"],
              icon: skills[index]["icon"],
              color: skills[index]["color"],
            );
          },
        ),
      ),
    );
  }
}

// 🔥 Interactive Skill Card
class SkillCard extends StatefulWidget {
  final String skillName;
  final IconData icon;
  final Color color;

  const SkillCard({
    super.key,
    required this.skillName,
    required this.icon,
    required this.color,
  });

  @override
  _SkillCardState createState() => _SkillCardState();
}

class _SkillCardState extends State<SkillCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: _isHovered ? widget.color.withOpacity(0.3) : Colors.grey[900],
          borderRadius: BorderRadius.circular(12),
          boxShadow: _isHovered
              ? [
                  BoxShadow(
                    color: widget.color.withOpacity(0.6),
                    blurRadius: 10,
                    spreadRadius: 2,
                    offset: const Offset(0, 5),
                  ),
                ]
              : [
                  const BoxShadow(
                    color: Colors.black54,
                    blurRadius: 6,
                    spreadRadius: 1,
                    offset: Offset(0, 3),
                  ),
                ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(widget.icon, size: 40, color: widget.color),
            const SizedBox(height: 12),
            Text(
              widget.skillName,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

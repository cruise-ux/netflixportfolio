import 'package:flutter/material.dart';

class ExperienceScreen extends StatelessWidget {
  final List<Map<String, String>> experiences = [
    {
      "title": "Senior Flutter Developer",
      "company": "TechWave Inc.",
      "duration": "2022 - Present",
      "description": "Developing high-performance cross-platform apps with Flutter & Firebase."
    },
    {
      "title": "UI/UX Designer",
      "company": "Freelancer",
      "duration": "2022 - Present",
      "description": "Designed sleek, user-friendly interfaces for mobile and web applications."
    },
    {
      "title": "Mobile Developer Intern",
      "company": "InnovateTech",
      "duration": "2019 - 2020",
      "description": "Worked on mobile UI development and API integration using Flutter."
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Experience", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: ListView.builder(
          itemCount: experiences.length,
          itemBuilder: (context, index) {
            return ExperienceCard(
              title: experiences[index]["title"]!,
              company: experiences[index]["company"]!,
              duration: experiences[index]["duration"]!,
              description: experiences[index]["description"]!,
              isHighlighted: index == 0, // Highlight the latest job
            );
          },
        ),
      ),
    );
  }
}

// 🔥 Interactive Experience Card
class ExperienceCard extends StatefulWidget {
  final String title;
  final String company;
  final String duration;
  final String description;
  final bool isHighlighted;

  const ExperienceCard({
    super.key,
    required this.title,
    required this.company,
    required this.duration,
    required this.description,
    this.isHighlighted = false,
  });

  @override
  _ExperienceCardState createState() => _ExperienceCardState();
}

class _ExperienceCardState extends State<ExperienceCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: _isHovered ? const Color.fromARGB(255, 65, 75, 210).withOpacity(0.3) : Colors.grey[900],
          borderRadius: BorderRadius.circular(12),
          boxShadow: _isHovered
              ? [
                  BoxShadow(
                    color: Colors.purple.withOpacity(0.4), 
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
          border: widget.isHighlighted
              ? Border.all(color: Colors.redAccent, width: 2)
              : null,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.title,
              style: TextStyle(
                color: widget.isHighlighted ? Colors.redAccent : Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              widget.company,
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              widget.duration,
              style: const TextStyle(
                color: Colors.white54,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              widget.description,
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

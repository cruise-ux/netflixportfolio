import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:netflixportfolio/app_const.dart';

class TopWidget extends StatefulWidget {
  const TopWidget({super.key});

  @override
  _TopWidgetState createState() => _TopWidgetState();
}

class _TopWidgetState extends State<TopWidget> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 600;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        transform: _isHovered ? Matrix4.translationValues(0, -5, 0) : Matrix4.identity(),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.white.withOpacity(0.3), width: 1.5),
          boxShadow: _isHovered
              ? [
                  BoxShadow(
                    color: Colors.white.withOpacity(0.1),
                    blurRadius: 15,
                    spreadRadius: 2,
                  ),
                ]
              : [],
        ),
        child: Stack(
          children: [
            // Background Image
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                AppImages.profileimg6,
                width: screenWidth,
                height: 500,
                fit: BoxFit.cover,
              ),
            ),
        
            // Bottom Left Positioned Content
            Positioned(
              bottom: 20,
              left: isMobile ? 10 : 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Name & Description
                  Text(
                    'Darryn',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: isMobile ? 28 : 36,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'NetflixSans',
                      shadows: [
                        Shadow(
                          blurRadius: 8,
                          color: Colors.black.withOpacity(0.8),
                          offset: const Offset(2, 2),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Dynamic and results-driven Senior Software Engineer\nwith 5+ years in full-stack development.',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: isMobile ? 14 : 16,
                      shadows: [
                        Shadow(
                          blurRadius: 6,
                          color: Colors.black.withOpacity(0.8),
                          offset: const Offset(1, 1),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
        
                  // Buttons (Row)
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        // Resume Button (With Hover Effect)
                        _buildHoverButton(
                          text: "Resume",
                          icon: Icons.play_arrow,
                          isPrimary: true,
                          onTap: () {},
                        ),
        
                        const SizedBox(width: 14), // Space between buttons
        
                        // LinkedIn Frosted Glass Button (With Hover Effect)
                        _buildHoverButton(
                          text: "LinkedIn",
                          icon: Icons.info_outline,
                          isPrimary: false,
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHoverButton({required String text, required IconData icon, required bool isPrimary, required VoidCallback onTap}) {
    bool _isHovered = false;

    return StatefulBuilder(
      builder: (context, setState) {
        return MouseRegion(
          onEnter: (_) => setState(() => _isHovered = true),
          onExit: (_) => setState(() => _isHovered = false),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            transform: _isHovered ? Matrix4.translationValues(0, -3, 0) : Matrix4.identity(),
            decoration: BoxDecoration(
              color: isPrimary ? Colors.white : Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.white.withOpacity(0.3)),
              boxShadow: _isHovered
                  ? [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.4),
                        blurRadius: 8,
                        offset: const Offset(2, 4),
                      ),
                    ]
                  : [],
            ),
            child: InkWell(
              onTap: onTap,
              borderRadius: BorderRadius.circular(8),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                child: Row(
                  children: [
                    Icon(icon, color: isPrimary ? Colors.black : Colors.white),
                    const SizedBox(width: 8),
                    Text(
                      text,
                      style: TextStyle(
                        color: isPrimary ? Colors.black : Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

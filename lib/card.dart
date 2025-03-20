import 'package:flutter/material.dart';


class CardWidget extends StatefulWidget {
  final String img;
  
  const CardWidget({super.key, required this.img});

  @override
  _CardWidgetState createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: 175,
        width: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3),
          boxShadow: _isHovered
              ? [
                  BoxShadow(
                    color: Colors.purple.withOpacity(0.4), // Subtle color glow
                    blurRadius: 10,
                    spreadRadius: 3,
                  ),
                ]
              : [],
        ),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(3),
              child: Image.asset(widget.img, fit: BoxFit.cover),
            ),

            // Gradient Overlay (Appears on Hover)
            if (_isHovered)
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Colors.black.withOpacity(0.6),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class Bg extends StatelessWidget {
  
final Widget child;
  const Bg({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF2C2B3B), // Top Color
            Color(0xFF000000), // Bottom Color
          ],
        ),
      ),
      child: child,
    );
  }
}

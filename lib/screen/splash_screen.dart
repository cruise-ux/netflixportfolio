import 'dart:async';
import 'package:flutter/material.dart';
import 'package:netflixportfolio/screen/profile_screen.dart';

import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double _scale = 1.0;
  double _opacity = 1.0;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 200), () {
      setState(() {
        _scale = 1.1; 
      });
    });

    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        _opacity = 0.0;
        _scale = 10.0;
      });
    });

    Future.delayed(Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => ProfileScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: AnimatedOpacity(
          duration: Duration(seconds: 1),
          opacity: _opacity,
          child: AnimatedScale(
            scale: _scale,
            duration: Duration(seconds: 2),
            child: Text('DARRYN', style: GoogleFonts.bebasNeue(fontSize: 20, fontWeight: FontWeight.w500,color: Colors.redAccent),),),
          ),
        ),
      );
    
  }
}

import 'package:flutter/material.dart';
import 'package:netflixportfolio/bg.dart';
import 'package:netflixportfolio/widget/middle_widget.dart';
import 'package:netflixportfolio/widget/top_widget.dart';

class HomeScreen extends StatelessWidget {
  final List<Map<String, String>> projects = [
    {"title": "Project 1", "image": "assets/project1.jpg"},
    {"title": "Project 2", "image": "assets/project2.jpg"},
    {"title": "Project 3", "image": "assets/project3.jpg"},
  ];

   HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Bg(
      child: Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('For you', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
        backgroundColor: Colors.transparent,
        centerTitle: true,
      ),
           body: Padding(
             padding: const EdgeInsets.only(left: 10,right: 10, ),
             child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
               child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 10,
                      children: [
                        TopWidget(),
                        
                        MiddleWidget(),
                      ],
               ),
             ),
           ),),
    );
    
  }
}

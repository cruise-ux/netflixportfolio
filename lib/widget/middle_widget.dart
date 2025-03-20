import 'package:flutter/material.dart';
import 'package:netflixportfolio/app_const.dart';
import 'package:netflixportfolio/card.dart';
import 'package:netflixportfolio/screen/contact_screen.dart';
import 'package:netflixportfolio/screen/experience_screen.dart';
import 'package:netflixportfolio/screen/project_screen.dart';
import 'package:netflixportfolio/screen/skill_screen.dart';

class MiddleWidget extends StatelessWidget {
  const MiddleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Today\'s Top Picks',
            style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            spacing: 10,
            children: [
              
              GestureDetector(
                 onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ExperienceScreen()));
                },
                child: CardWidget(img:AppImages.profileimg8,)),
              
          
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>SkillsScreen()));
                },
                child: CardWidget(img:AppImages.profileimg9,)),
              
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>ProjectsScreen()));
                },
                child: CardWidget(img:AppImages.profileimg10,)),
             
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ContactMeScreen()));
                },
                child: CardWidget(img:AppImages.profileimg7,)),
            ],
          ),
        ),
      ],
    );
  }
}

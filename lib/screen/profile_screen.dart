import 'package:flutter/material.dart';
import 'package:netflixportfolio/app_const.dart';
import 'package:netflixportfolio/screen/home_screen.dart';
import 'package:netflixportfolio/widget/profile_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Who\'s Watching?',style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300,color: Colors.white, fontFamily: 'poppins'),),
              SizedBox(height: 24,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                     onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                },
                    child: ProfileWidget(image: AppImages.profileimg1, name: 'Profile 1',)),
                  SizedBox(width: 20,),
                  ProfileWidget(image: AppImages.profileimg2, name: 'Profile 2',),
                  SizedBox(width: 20,),
                  ProfileWidget(image: AppImages.profileimg3, name: 'Profile 3',),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

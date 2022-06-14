import 'package:flutter/material.dart';
import 'package:klaep/screens/play_videos_screen.dart';

import '../widgets/reusable_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height=MediaQuery.of(context).size.height;
    final width=MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body:  Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: height*0.28,
            width: width,
            color: Colors.red,
            child: Image.asset("assets/images/klaep_Logo.jpg",fit: BoxFit.cover,),
          ),

          ReusableButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>PlayVideos()));
              },
              txt: "Get Started"
          ),
        ],
      ),
    );
  }
}

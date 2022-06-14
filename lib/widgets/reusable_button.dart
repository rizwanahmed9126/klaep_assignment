import 'package:flutter/material.dart';

class ReusableButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String txt;

  const ReusableButton({Key? key,required this.onPressed,required this.txt}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height=MediaQuery.of(context).size.height;
    final width=MediaQuery.of(context).size.width;
    return Container(
      height: height*0.07,
      width: width*0.8,
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Color(0xFFf3b740),
        borderRadius: BorderRadius.circular(28),


      ),
      child: TextButton(
          onPressed: onPressed,

          child: Text("$txt",style: TextStyle(color: Colors.black),)
      ),
    );
  }
}

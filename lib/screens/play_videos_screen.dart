import 'package:flutter/material.dart';
import 'package:klaep/screens/videos_screen.dart';
import 'package:klaep/widgets/reusable_button.dart';


class PlayVideos extends StatelessWidget {
  const PlayVideos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final _controller=PageController();

    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView(
        controller: _controller,
        scrollDirection: Axis.vertical,

        children: [
          VideoPlayerWidget(videoPath: "drums"),
          VideoPlayerWidget(videoPath: "piano"),
        ],
      )


    );
  }
}
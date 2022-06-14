import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';


class VideoPlayerWidget extends StatefulWidget {
  final String videoPath;
  VideoPlayerWidget({required this.videoPath});

  @override
  _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  VideoPlayerController? _controller1;
  VideoPlayerController? _controller2;

  @override
  void initState() {
    super.initState();

    _controller1 = VideoPlayerController.asset(
        'assets/videos/drums.mp4',
        videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true,allowBackgroundPlayback: true)

    )
      ..initialize().then((_) {
        _controller1!.play();
        _controller1!.setLooping(true);
        setState(() {});

      });
    _controller2 = VideoPlayerController.asset(
        'assets/videos/${widget.videoPath}.mp4',
        videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true)

    )
      ..initialize().then((_) {
        _controller2!.play();
        _controller2!.setLooping(true);

        setState(() {});
      });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
            children: <Widget>[
              _controller1!.value.isInitialized
                  ? Container(
                height: MediaQuery.of(context).size.height/2,//_controller1!.value.aspectRatio,
                child: VideoPlayer(_controller1!),
              )
                  : Container(),
              _controller2!.value.isInitialized
                  ? Container(
                height: MediaQuery.of(context).size.height/2,
                child: VideoPlayer(_controller2!),
              )
                  : Container(),
            ],
          )),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFFf3b740),
        onPressed: () {
          setState(() {
            togglePlaying();
          });
        },
        child: Icon(
          _controller1!.value.isPlaying ? Icons.pause : Icons.play_arrow,
          color: Colors.black,
        ),
      ),
    );
  }

  void startBothPlayers() async {
    await _controller1!.play();
    await _controller2!.play();
  }

  void stopBothPlayers() async {
    await _controller1!.pause();
    await _controller2!.pause();
  }

  void togglePlaying() {
    _controller1!.value.isPlaying || _controller2!.value.isPlaying
        ? stopBothPlayers()
        : startBothPlayers();
  }

  @override
  void dispose() {
    super.dispose();
    _controller1!.dispose();
    _controller2!.dispose();
  }
}
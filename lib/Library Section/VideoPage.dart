import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';


class VideoPage extends StatefulWidget {
  @override
  _VideoPageState createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  YoutubePlayerController _controller;

  String myFavouriteSong = "https://youtu.be/Zev5tHjCB_s";

  @override
  Widget build(BuildContext context) {

    String _data = ModalRoute.of(context)
        .settings
        .arguments;

    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(_data),
    );

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: YoutubePlayer(
              controller: _controller,
              showVideoProgressIndicator: true,
            ),
        ),
      );
  }
}





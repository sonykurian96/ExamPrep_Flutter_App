import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

//import 'library.dart';

class VideoPage extends StatefulWidget {
  @override
  _VideoPageState createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  YoutubePlayerController _controller;
  WebViewController _webViewController;
  bool isInfinite = true;

  String myFavouriteSong = "https://youtu.be/Zev5tHjCB_s";

  @override
  Widget build(BuildContext context) {
    String _data = ModalRoute.of(context)
        .settings
        .arguments; // fetches data from another page

    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(_data),
    );

    return Scaffold(
      body: SafeArea(
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                YoutubePlayer(
                  controller: _controller,
                  progressIndicatorColor: Colors.amber,
                  progressColors:
                      ProgressBarColors(backgroundColor: Colors.amber),
                  showVideoProgressIndicator: true,
                ),
                SizedBox(height: 5),
                // DraggableScrollableSheet(builder: null)
                Container(
                  width: MediaQuery.of(context).size.width, //350,
                  height: MediaQuery.of(context).size.height,
                  child: WebView(
                    initialUrl:
                        "https://cse.google.com/cse?cx=d6585b7488a336801",
                    javascriptMode: JavascriptMode.unrestricted,
                    gestureRecognizers: [
                      Factory(() => VerticalDragGestureRecognizer()),
                    ].toSet(),
                    onWebViewCreated: (WebViewController webViewController) {
                      _webViewController = webViewController;
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange[500],
        child: Icon(
          Icons.keyboard_return,
        ),
        onPressed: () {
          _webViewController
              .loadUrl("https://cse.google.com/cse?cx=d6585b7488a336801");
        },
      ),
    );
  }
}

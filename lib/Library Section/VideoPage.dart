import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import 'library.dart';

class VideoPage extends StatefulWidget {
  @override
  _VideoPageState createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  WebViewController controller;

  @override
  Widget build(BuildContext context) {
    String _data = ModalRoute.of(context)
        .settings
        .arguments; // fetches data from another page

    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Video Section"),
      //   centerTitle: true,
      //   backgroundColor: Colors.orange[500],
      // ),
      body: SafeArea(
        child: Stack(children: [
          WebView(
            initialUrl: _data,
            javascriptMode: JavascriptMode.unrestricted,
          ),
          Positioned(
            width: 415,
            height: 51,
            child: Card(
              child: Padding(
                padding: EdgeInsets.fromLTRB(120, 6.0, 0, 10.0),
                child: Text(
                  "Video Section",
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                  ),
                ),
              ),
              color: Colors.orange[500],
            ),
          ),
          Positioned(
            left: 5,
            child: IconButton(
                icon: Icon(Icons.arrow_back,size: 25,color: Colors.white,),
                onPressed: () {
                  Navigator.pop(context,
                      MaterialPageRoute(builder: (context) => VideoList()));
                }),
          ),
          Positioned(
              right: 7.2,
              top: 58,
              child: Icon(
                Icons.bookmark,
                size: 32,
                color: Colors.orange[500],
              )),
          Positioned(
            top: 279,
            width: 415,
            height: 50,
            right: 0.1,
            child: Card(
              elevation: 7,
              color: Colors.orange[500],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(70.0, 8.0, 8.0, 8.0),
                child: Text(
                  "Ask your doubts below",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          // 471,410
          Positioned(
            width: 410,
            height: 490,
            top: 325,
            child: DecoratedBox(
              child: WebView(
                  initialUrl: "https://cse.google.com/cse?cx=d6585b7488a336801",
                  javascriptMode: JavascriptMode.unrestricted,
                  onWebViewCreated: (WebViewController webViewController) {
                    controller = webViewController;
                  }),
              decoration: BoxDecoration(color: Colors.white),
            ),
          ),
          Positioned(
            bottom: 5,
            right: 5,
            child: FloatingActionButton(
              backgroundColor: Colors.orange[500],
              child: Icon(
                Icons.keyboard_return,
              ),
              onPressed: () {
                controller
                    .loadUrl("https://cse.google.com/cse?cx=d6585b7488a336801");
              },
            ),
          ),
          AlertDialog(
            title: Text("isko jaldi hi thik kiya jayega"),
            actions: [
              RaisedButton(onPressed: () {
              }, child: Text('Chalega, apne time le')),
              RaisedButton(onPressed: () {
              }, child: Text('yaar jaldi khatam kar')),
            ],
          )
        ]),
      ),
    );
  }
}

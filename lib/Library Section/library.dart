import 'package:clickable_list_wheel_view/clickable_list_wheel_widget.dart';
import 'package:flutter/material.dart';
import 'package:ExamPrep/Library%20Section/videoData.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

// "https://cse.google.com/cse?cx=d6585b7488a336801"

class VideoList extends StatefulWidget {
  @override
  _VideoListState createState() => _VideoListState();
}

class _VideoListState extends State<VideoList> {
  final _scrollController = FixedExtentScrollController();
  static const double _itemHeight = 60;
  static const int _itemCount = 8;
  String youtubeData;

  List<VideoData> _videoData = [
    VideoData(
        title: "Introduction to Data Structures",
        videoLink: "https://youtu.be/bum_19loj9A"),
    VideoData(title: "Linked list", videoLink: "https://youtu.be/_jQhALI4ujg"),
    VideoData(title: "Graphs", videoLink: "https://youtu.be/D21-XVw6nYw"),
    VideoData(title: "Heaps", videoLink: "https://youtu.be/2DmK_H7IdTo"),
    VideoData(
        title: "Sorting Techniques", videoLink: "https://youtu.be/kgBjXUE_Nwc"),
    VideoData(title: "Stack", videoLink: "https://youtu.be/bxRVz8zklWM"),
    VideoData(title: "Queue", videoLink: "https://youtu.be/zp6pBNbUB2U"),
    VideoData(title: "Tree", videoLink: "https://youtu.be/YAdLFsTG70w"),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          ClickableListWheelScrollView(
            scrollController: _scrollController,
            itemHeight: _itemHeight,
            itemCount: _itemCount,
            onItemTapCallback: (index) {
              setState(() {
                youtubeData = _videoData[index].videoLink;
              });
            },
            child: ListWheelScrollView.useDelegate(
              itemExtent: _itemHeight,
              controller: _scrollController,
              physics: FixedExtentScrollPhysics(),
              childDelegate: ListWheelChildBuilderDelegate(
                builder: (context, index) => _child(index),
                childCount: _itemCount,
              ),
            ),
          ),
          VideoPlayer(
            myValue: youtubeData,
            key: UniqueKey(),
          )
        ],
      ),
    );
  }

  Widget _child(int index) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
      child: Card(
        shadowColor: Colors.amber,
        elevation: 20,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        child: ListTile(
          title: Text(
            _videoData[index].title,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          leading: Icon(
            Icons.ondemand_video,
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}

class VideoPlayer extends StatefulWidget {
  const VideoPlayer({Key key,this.myValue}):super(key: key);
  final String myValue;

  @override
  _VideoPlayerState createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  String localValue;
  String garbage;

  @override
  void initState(){
    localValue = widget.myValue;
    super.initState();
  }

  YoutubePlayerController _controller;
  // String youtubeData = "https://youtu.be/Zev5tHjCB_s";

  @override
  Widget build(BuildContext context) {
    localValue == null ? garbage = "ignore" : _controller = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(localValue)
    );

    return localValue == null ? Container(
      width: 400,
      height: 200,
      child: Image.asset("assets/videoPlayerImage.png")
    ) : YoutubePlayer(
      controller: _controller,
      showVideoProgressIndicator: true,
    );
  }
}


import 'package:clickable_list_wheel_view/clickable_list_wheel_widget.dart';
import 'package:flutter/material.dart';

import 'VideoPage.dart';

class VideoList extends StatefulWidget {
  @override
  _VideoListState createState() => _VideoListState();
}

class _VideoListState extends State<VideoList> {
  List<String> list = [
    'Introduction to Data Structures',
    'Linked list',
    'Graphs',
    'Heaps',
    'Sorting Techniques',
    'Stack',
    'Queue',
    'Tree'
  ];

  List<String> videoList = [
    "https://youtu.be/bum_19loj9A", // introduction
    "https://youtu.be/_jQhALI4ujg", // linked list
    "https://youtu.be/D21-XVw6nYw", // graphs
    "https://youtu.be/2DmK_H7IdTo", // heaps
    "https://youtu.be/kgBjXUE_Nwc", // sorting techniques
    "https://youtu.be/bxRVz8zklWM", // stack
    "https://youtu.be/zp6pBNbUB2U", // queue
    "https://youtu.be/YAdLFsTG70w" // tree
  ];

  final _scrollController = FixedExtentScrollController();
  static const double _itemHeight = 60;
  static const int _itemCount = 8;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: ClickableListWheelScrollView(
            scrollController: _scrollController,
            itemHeight: _itemHeight,
            itemCount: _itemCount,
            onItemTapCallback: (index) {
              print("you tapped this $index");
              Navigator.push(context,
                MaterialPageRoute(
                  builder: (context) => VideoPage(),
                  settings: RouteSettings(
                  arguments: videoList[index],
                  ),
                )
              );
            },
            child: ListWheelScrollView.useDelegate(
              itemExtent: _itemHeight,
              controller: _scrollController,
              physics: FixedExtentScrollPhysics(),
              childDelegate: ListWheelChildBuilderDelegate(
                builder: (context, index) => _child(index),
                childCount: _itemCount,
              ),
            )
        )
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
            list[index],
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

import 'package:clickable_list_wheel_view/clickable_list_wheel_widget.dart';
import 'package:flutter/material.dart';
import "NotesPage.dart";

class Note extends StatefulWidget {
  @override
  _NoteState createState() => _NoteState();
}

class _NoteState extends State<Note> {
  List<String> list = [
    'Arrays',
    'Linked list',
    'Stacks',
    'Queues',
    'Trees',
    'Heaps',
    'Graphs',
    'Hash Tables'
  ];

  List<String> noteList = [
    "https://www.thedshandbook.com/arrays/",
    "https://www.thedshandbook.com/linked-lists/",
    "https://www.thedshandbook.com/stacks/",
    "https://www.thedshandbook.com/queues/",
    "https://www.thedshandbook.com/trees/",
    "https://www.thedshandbook.com/heaps/",
    "https://www.thedshandbook.com/graphs/",
    "https://www.thedshandbook.com/hash-tables/"
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
                    builder: (context) => NotesPage(),
                    settings: RouteSettings(
                      arguments: noteList[index],
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
            Icons.book,
            color: Colors.blue,
          ),
        ),
      ),
    );
  }
}
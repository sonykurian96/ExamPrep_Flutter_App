import 'package:clickable_list_wheel_view/clickable_list_wheel_widget.dart';
import 'package:flutter/material.dart';
import "NotesPage.dart";
import 'noteData.dart';

class Note extends StatelessWidget {


List<NoteData> _noteData = [
  NoteData(notesTitle: 'Arrays',notesLink: "https://www.thedshandbook.com/arrays/"),
  NoteData(notesTitle: 'Linked list',notesLink: "https://www.thedshandbook.com/linked-lists/"),
  NoteData(notesTitle: 'Stacks',notesLink: "https://www.thedshandbook.com/stacks/"),
  NoteData(notesTitle: 'Queues',notesLink: "https://www.thedshandbook.com/queues/"),
  NoteData(notesTitle: 'Trees',notesLink: "https://www.thedshandbook.com/trees/"),
  NoteData(notesTitle: 'Heaps',notesLink: "https://www.thedshandbook.com/heaps/"),
  NoteData(notesTitle: 'Graphs',notesLink: "https://www.thedshandbook.com/graphs/"),
  NoteData(notesTitle: 'Hash Tables',notesLink: "https://www.thedshandbook.com/hash-tables/"),

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
                      arguments: _noteData[index].notesLink,
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
            _noteData[index].notesTitle,
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

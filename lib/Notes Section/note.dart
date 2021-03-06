import 'package:clickable_list_wheel_view/clickable_list_wheel_widget.dart';
import 'package:flutter/material.dart';
import 'package:wave_transition/wave_transition.dart';
import "NotesPage.dart";
import 'noteData.dart';

class Note extends StatelessWidget {
  List<NoteData> _noteData = [
    NoteData(
        notesTitle: 'Arrays',
        notesLink: "https://www.thedshandbook.com/arrays/"),
    NoteData(
        notesTitle: 'Linked list',
        notesLink: "https://www.thedshandbook.com/linked-lists/"),
    NoteData(
        notesTitle: 'Stacks',
        notesLink: "https://www.thedshandbook.com/stacks/"),
    NoteData(
        notesTitle: 'Queues',
        notesLink: "https://www.thedshandbook.com/queues/"),
    NoteData(
        notesTitle: 'Trees', notesLink: "https://www.thedshandbook.com/trees/"),
    NoteData(
        notesTitle: 'Heaps', notesLink: "https://www.thedshandbook.com/heaps/"),
    NoteData(
        notesTitle: 'Graphs',
        notesLink: "https://www.thedshandbook.com/graphs/"),
    NoteData(
        notesTitle: 'Hash Tables',
        notesLink: "https://www.thedshandbook.com/hash-tables/"),
  ];

  final _scrollController = FixedExtentScrollController();
  static const double _itemHeight = 60;
  static const int _itemCount = 8;

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
              print("you tapped this $index");
              Navigator.push(
                  context,
                  WaveTransition(
                      child: NotesPage(),
                      center: FractionalOffset(0.5, 0.5),
                      duration: Duration(milliseconds: 1500),
                      settings: RouteSettings(
                          arguments: _noteData[index].notesLink)));
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
          InkWell(
            child: ContributeCard(),
            onTap: (){
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text("Oops!"),
                      content: Text("This feature is in development"),
                      actions: [
                        FlatButton(onPressed: (){
                          Navigator.pop(context);
                        }, child: Text("OK"))
                      ],
                    );
                  });
            },
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

class ContributeCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 20, 0, 5),
      child: Card(
        color: Colors.white70,
        shadowColor: Colors.amber,
        elevation: 20,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        child:Container(
            child:Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQkFkioFdejTMtMdBiNq6BhaIq0-ppuT1tP-g&usqp=CAU"),
        ),
        ),
    );
  }
}

import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';

import 'customwidget.dart';
import 'data.dart';

class Paper extends StatefulWidget {
  @override
  _PaperState createState() => _PaperState();
}

class _PaperState extends State<Paper> {
  bool displayAnswer = false;
  final GlobalKey<ExpansionTileCardState> cardA = new GlobalKey();

  List<Data> _data = [
    Data(question: "question1",answer: "answer1",link: "link1"),
    Data(question: "question2",answer: "answer2",link: "link2"),
    Data(question: "question3",answer: "answer3",link: "link3"),
    Data(question: "question4",answer: "answer4",link: "link4"),
    Data(question: "question5",answer: "answer5",link: "link5"),
    Data(question: "question6",answer: "answer1",link: "link1"),
    Data(question: "question7",answer: "answer2",link: "link2"),
    Data(question: "question8",answer: "answer3",link: "link3"),
    Data(question: "question9",answer: "answer4",link: "link4"),
    Data(question: "question10",answer: "answer5",link: "link5"),
  ];


  Widget button() {
    return RaisedButton(
      textColor: Colors.white,
      color: Colors.orange[500],
      child: Text("View Answer"),
      onPressed: () {
        setState(() {
          displayAnswer = !displayAnswer;
        });
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Enjoy!!!"),
        centerTitle: true,
        backgroundColor: Colors.orange[500],
      ),
      body: ListView.builder(
        itemCount: _data.length,
          itemBuilder: (context,index){
            return Custom(
              question: _data[index].question,
              answer: _data[index].answer,
              videoLink: _data[index].link,
              isVisible: displayAnswer,
              customRaisedButton: button(),
            );
          }
      ),

    );
  }
}

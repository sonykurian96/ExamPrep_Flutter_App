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
    Data(question: "question1", answer: "answer1", link: "https://youtu.be/bum_19loj9A"),
    Data(question: "question2", answer: "answer2", link: "https://youtu.be/bum_19loj9A"),
    Data(question: "question3", answer: "answer3", link: "https://youtu.be/bum_19loj9A"),
    Data(question: "question4", answer: "answer4", link: "https://youtu.be/bum_19loj9A"),
    Data(question: "question5", answer: "answer5", link: "https://youtu.be/bum_19loj9A"),
    Data(question: "question6", answer: "answer1", link: "https://youtu.be/bum_19loj9A"),
    Data(question: "question7", answer: "answer2", link: "https://youtu.be/bum_19loj9A"),
    Data(question: "question8", answer: "answer3", link: "https://youtu.be/bum_19loj9A"),
    Data(question: "question9", answer: "answer4", link: "https://youtu.be/bum_19loj9A"),
    Data(question: "question10", answer: "answer5", link: "https://youtu.be/bum_19loj9A"),
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
    String _string = ModalRoute.of(context).settings.arguments;
    print(_string);
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.orange[800], Colors.amber]),
          ),
        ),
        title: Text("Enjoy-->"),
        centerTitle: true,
        backgroundColor: Colors.orange[500],
      ),
      body: ListView.builder(
          itemCount: _data.length,
          itemBuilder: (context, index) {
            return Custom(
              question: _data[index].question,
              answer: _data[index].answer,
              videoLink: _data[index].link,
              isVisible: displayAnswer,
              customRaisedButton: button(),
            );
          }),
    );
  }
}

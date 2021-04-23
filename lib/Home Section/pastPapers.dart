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


  List<Data> _data1 = [
    Data(question: "question5", answer: "answer1", link: "https://youtu.be/bum_19loj9A"),
    Data(question: "question1", answer: "answer2", link: "https://youtu.be/bum_19loj9A"),
    Data(question: "question7", answer: "answer3", link: "https://youtu.be/bum_19loj9A"),
    Data(question: "question3", answer: "answer4", link: "https://youtu.be/bum_19loj9A"),
    Data(question: "question8", answer: "answer5", link: "https://youtu.be/bum_19loj9A"),
    Data(question: "question9", answer: "answer1", link: "https://youtu.be/bum_19loj9A"),
    Data(question: "question7", answer: "answer2", link: "https://youtu.be/bum_19loj9A"),
    Data(question: "question8", answer: "answer3", link: "https://youtu.be/bum_19loj9A"),
    Data(question: "question9", answer: "answer4", link: "https://youtu.be/bum_19loj9A"),
    Data(question: "question10", answer: "answer5", link: "https://youtu.be/bum_19loj9A"),
  ];

  List<Data> _data2 = [
    Data(question: "question3", answer: "answer1", link: "https://youtu.be/bum_19loj9A"),
    Data(question: "question2", answer: "answer2", link: "https://youtu.be/bum_19loj9A"),
    Data(question: "question5", answer: "answer3", link: "https://youtu.be/bum_19loj9A"),
    Data(question: "question1", answer: "answer4", link: "https://youtu.be/bum_19loj9A"),
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
    List<dynamic> _values = ModalRoute.of(context).settings.arguments;

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
        title: Text("Sorted Successfully"),
        centerTitle: true,
        backgroundColor: Colors.orange[500],
      ),
      body: ListView.builder(
        reverse: _values[1],
          itemCount: _data1.length,
          itemBuilder: (context, index) {
            return _values[0] == 1 ? Custom(
              question: _data1[index].question,
              answer: _data1[index].answer,
              videoLink: _data1[index].link,
              isVisible: displayAnswer,
              customRaisedButton: button(),
            ) : Custom(
              question: _data2[index].question,
              answer: _data2[index].answer,
              videoLink: _data2[index].link,
              isVisible: displayAnswer,
              customRaisedButton: button(),
            );
          }),
    );
  }
}

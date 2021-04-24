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
    Data(question: "Differentiate between file and structure storage structure.", answer: "The key difference between both the data structure is the memory area that is being accessed. When dealing with the structure that resides the main memory of the computer system, this is referred to as storage structure. When dealing with an auxiliary structure, we refer to it as file structures.", link: "https://youtu.be/bum_19loj9A"),
    Data(question: "When is a binary search best applied?", answer: "A binary search is an algorithm that is best applied to search a list when the elements are already in order or sorted. The list is searched starting in the middle, such that if that middle value is not the target search key, it will check to see if it will continue the search on the lower half of the list or the higher half. The split and search will then continue in the same manner.", link: "https://youtu.be/bum_19loj9A"),
    Data(question: "What is a linked list?", answer: "A linked list is a sequence of nodes in which each node is connected to the node following it. This forms a chain-like link for data storage.", link: "https://youtu.be/bum_19loj9A"),
    Data(question: "Which data structures are applied when dealing with a recursive function?", answer: "Recursion, is a function that calls itself based on a terminating condition, makes use of the stack. Using LIFO, a call to a recursive function saves the return address so that it knows how to return to the calling function after the call terminates.", link: "https://youtu.be/bum_19loj9A"),
    Data(question: "What is a stack?", answer: "A stack is a data structure in which only the top element can be accessed. As data is stored in the stack, each data is pushed downward, leaving the most recently added data on top", link: "https://youtu.be/bum_19loj9A"),
    Data(question: "Explain Binary Search Tree", answer: "A binary search tree stores data in such a way that they can be retrieved very efficiently. The left subtree contains nodes whose keys are less than the node’s key value, while the right subtree contains nodes whose keys are greater than or equal to the node’s key value. Moreover, both subtrees are also binary search trees.", link: "https://youtu.be/bum_19loj9A"),
    Data(question: "What is the difference between a PUSH and a POP?", answer: "Pushing and popping applies to the way data is stored and retrieved in a stack. A push denotes data being added to it, meaning data is being “pushed” into the stack. On the other hand, a pop denotes data retrieval, and in particular, refers to the topmost data being accessed.", link: "https://youtu.be/bum_19loj9A"),
    Data(question: "What is the advantage of the heap over a stack?", answer: "The heap is more flexible than the stack. That’s because memory space for the heap can be dynamically allocated and de-allocated as needed. However, the memory of the heap can at times be slower when compared to that stack.", link: "https://youtu.be/bum_19loj9A"),
    Data(question: "What is data structure?", answer: "Data structure refers to the way data is organized and manipulated. It seeks to find ways to make data access more efficient. When dealing with the data structure, we not only focus on one piece of data but the different set of data and how they can relate to one another in an organized manner.", link: "https://youtu.be/bum_19loj9A"),
    Data(question: "What is a graph?", answer: "A graph is one type of data structure that contains a set of ordered pairs. These ordered pairs are also referred to as edges or arcs and are used to connect nodes where data can be stored and retrieved.", link: "https://youtu.be/bum_19loj9A"),
  ];

  List<Data> _data2 = [
    Data(question: "What is the difference between a PUSH and a POP?", answer: "Pushing and popping applies to the way data is stored and retrieved in a stack. A push denotes data being added to it, meaning data is being “pushed” into the stack. On the other hand, a pop denotes data retrieval, and in particular, refers to the topmost data being accessed.", link: "https://youtu.be/bum_19loj9A"),
    Data(question: "Which data structures are applied when dealing with a recursive function?", answer: "Recursion, is a function that calls itself based on a terminating condition, makes use of the stack. Using LIFO, a call to a recursive function saves the return address so that it knows how to return to the calling function after the call terminates.", link: "https://youtu.be/bum_19loj9A"),
    Data(question: "When is a binary search best applied?", answer: "A binary search is an algorithm that is best applied to search a list when the elements are already in order or sorted. The list is searched starting in the middle, such that if that middle value is not the target search key, it will check to see if it will continue the search on the lower half of the list or the higher half. The split and search will then continue in the same manner.", link: "https://youtu.be/bum_19loj9A"),
    Data(question: "Differentiate between file and structure storage structure.", answer: "The key difference between both the data structure is the memory area that is being accessed. When dealing with the structure that resides the main memory of the computer system, this is referred to as storage structure. When dealing with an auxiliary structure, we refer to it as file structures.", link: "https://youtu.be/bum_19loj9A"),
    Data(question: "What is a stack?", answer: "A stack is a data structure in which only the top element can be accessed. As data is stored in the stack, each data is pushed downward, leaving the most recently added data on top", link: "https://youtu.be/bum_19loj9A"),
    Data(question: "What is a linked list?", answer: "A linked list is a sequence of nodes in which each node is connected to the node following it. This forms a chain-like link for data storage.", link: "https://youtu.be/bum_19loj9A"),
    Data(question: "What is the advantage of the heap over a stack?", answer: "aThe heap is more flexible than the stack. That’s because memory space for the heap can be dynamically allocated and de-allocated as needed. However, the memory of the heap can at times be slower when compared to that stack.", link: "https://youtu.be/bum_19loj9A"),
    Data(question: "What is data structure?", answer: "Data structure refers to the way data is organized and manipulated. It seeks to find ways to make data access more efficient. When dealing with the data structure, we not only focus on one piece of data but the different set of data and how they can relate to one another in an organized manner.", link: "https://youtu.be/bum_19loj9A"),
    Data(question: "What is a graph?", answer: "A graph is one type of data structure that contains a set of ordered pairs. These ordered pairs are also referred to as edges or arcs and are used to connect nodes where data can be stored and retrieved.", link: "https://youtu.be/bum_19loj9A"),
    Data(question: "What is the advantage of the heap over a stack?", answer: "aThe heap is more flexible than the stack. That’s because memory space for the heap can be dynamically allocated and de-allocated as needed. However, the memory of the heap can at times be slower when compared to that stack.", link: "https://youtu.be/bum_19loj9A"),
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

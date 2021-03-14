import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:ExamPrep/Code%20Runner/codeEditor.dart';
import 'package:ExamPrep/Home%20Section/home.dart';
import 'package:ExamPrep/Library%20Section/library.dart';
import 'package:ExamPrep/Notes%20Section/note.dart';

class MyRoute {
  final IconData iconData;
  final Widget page;

  MyRoute({this.iconData, this.page});
}

class BottomNavigation extends StatelessWidget {
  
  Function onTap;

  GlobalKey navigationKey;

  BottomNavigation({this.onTap,this.navigationKey});

  List<MyRoute> pages = [
    MyRoute(
      iconData: Icons.home,
      page: Home(),
    ),
    MyRoute(
      iconData: Icons.code,
      page: CodeEditor(),
    ),
    MyRoute(
      iconData: Icons.library_books,
      page: Note(),
    ),
    MyRoute(
      iconData: Icons.video_library,
      page: VideoList(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      key: navigationKey,
      color: Colors.orange[500],
      buttonBackgroundColor: Colors.orange[500],
      backgroundColor: Colors.white,
      height: 65,
      items: pages
          .map((p) => Icon(
                p.iconData,
                size: 30,
                color: Colors.white,
              ))
          .toList(),
      animationDuration: Duration(milliseconds: 250),
      onTap: onTap,
    );
  }
}


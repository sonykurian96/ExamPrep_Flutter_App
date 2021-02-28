import 'package:animated_splash/animated_splash.dart';
import 'package:backdrop/backdrop.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_app/Navigation Drawer/backlayer.dart';

import 'Code Runner/codeEditor.dart';
import 'Home Section/home.dart';
import 'Library Section/library.dart';
import 'Notes Section/note.dart';

void main() => runApp(MaterialApp(
      home: AnimatedSplash(
        home: MainPage(),
        imagePath: "assets/FixSplashImage.jpeg",
        duration: 2500,
      ),//MainPage(),
      debugShowCheckedModeBanner: false,
    ));


class MyRoute {
  final IconData iconData;
  final Widget page;

  MyRoute({this.iconData, this.page});
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _pageIndex = 0;
  GlobalKey _bottomNavigationKey = GlobalKey();
  List pages = [
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
    return BackdropScaffold(
      appBar: BackdropAppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.orange[800], Colors.amber]
              ),
          ),
        ),
        backgroundColor: Colors.orange[500],
        title: Text('ExamPrep'),
        centerTitle: true,
        actions: <Widget>[
          BackdropToggleButton(
            icon: AnimatedIcons.list_view,
          )
        ],
      ),
      backLayer: BackLayer(),
      backLayerBackgroundColor: Colors.orange[500],

      frontLayer: pages[_pageIndex].page,
      frontLayerBackgroundColor: Colors.white,

      bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
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
          onTap: (index) {
            setState(() {
              _pageIndex = index;
            });
          }),
    );
  }
}

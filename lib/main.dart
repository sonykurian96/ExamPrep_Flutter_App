import 'package:animated_splash/animated_splash.dart';
import 'package:backdrop/backdrop.dart';
import 'package:flutter/material.dart';
import 'package:ExamPrep/Navigation Drawer/backlayer.dart';
import 'package:ExamPrep/Navigation%20Drawer/bottom_navigation.dart';

void main() => runApp(MaterialApp(
      home: AnimatedSplash(
        home: MainPage(),
        imagePath: "assets/FixSplashImage.jpeg",
        duration: 2500,
      ), //MainPage(),
      debugShowCheckedModeBanner: false,
    ));


class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  int _pageIndex = 0;
  GlobalKey _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
        return BackdropScaffold(
          appBar: BackdropAppBar(
            flexibleSpace: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Colors.orange[800], Colors.amber]),
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
    
          frontLayer: BottomNavigation().pages[_pageIndex].page,//pages[_pageIndex].page,
          frontLayerBackgroundColor: Colors.white,


      bottomNavigationBar: BottomNavigation(
        navigationKey: _bottomNavigationKey,
        onTap: (index) {
            setState(() {
              _pageIndex = index;
            });
          },
        ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class CodeEditor extends StatefulWidget {
  @override
  _CodeEditorState createState() => _CodeEditorState();
}

class _CodeEditorState extends State<CodeEditor> {
  WebViewController controller;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Stack(
            children :[
              WebView(
              initialUrl: "https://www.programiz.com/python-programming/online-compiler/" ,
              javascriptMode: JavascriptMode.unrestricted,
                  onWebViewCreated: (WebViewController webViewController) {
                    controller = webViewController;
              }
            ),
              Container(
                color: Colors.white,
                padding: EdgeInsets.fromLTRB(8, 2, 0, 0),
                child: ListTile(
                  leading: Icon(Icons.code),
                  title: Text("\t"*10+"Online Compiler"),
                ),
              ),
              Divider(
                color: Colors.black,
                height: 100,
              ),
              Container(
                padding: EdgeInsets.fromLTRB(12, 62, 0, 0),
                child: Icon(Icons.note,color: Colors.white,),
              ),
              SpeedDial(
                // both default to 16
                marginRight: 40,
                marginBottom: 100,
                animatedIcon: AnimatedIcons.menu_close,
                animatedIconTheme: IconThemeData(size: 22.0),
                closeManually: false,
                curve: Curves.bounceIn,
                overlayColor: Colors.black,
                overlayOpacity: 0.5,
                onOpen: () => print('OPENING DIAL'),
                onClose: () => print('DIAL CLOSED'),
                tooltip: 'Speed Dial',
                heroTag: 'speed-dial-hero-tag',
                backgroundColor: Colors.orange[500],
                foregroundColor: Colors.white,
                elevation: 18.0,
                shape: CircleBorder(),
                children: [
                  SpeedDialChild(
                      child: Icon(Icons.code),
                      backgroundColor: Colors.red,
                      label: 'Python',
                      labelStyle: TextStyle(fontSize: 18.0),
                      onTap: () => setState((){
                        controller.loadUrl("https://www.programiz.com/python-programming/online-compiler/");
                      }),
                  ),
                  SpeedDialChild(
                    child: Icon(Icons.code),
                    backgroundColor: Colors.blue,
                    label: 'C++',
                    labelStyle: TextStyle(fontSize: 18.0),
                    onTap: () => setState((){
                      controller.loadUrl("https://www.programiz.com/cpp-programming/online-compiler/");
                    }),
                  ),
                  SpeedDialChild(
                    child: Icon(Icons.code),
                    backgroundColor: Colors.green,
                    label: 'C',
                    labelStyle: TextStyle(fontSize: 18.0),
                    onTap: () => setState((){
                      controller.loadUrl("https://www.programiz.com/c-programming/online-compiler/");
                      }),
                  ),
                ],
              ),
          ],
          ),
        )
    );
  }
}
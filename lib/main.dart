import 'package:backdrop/backdrop.dart';
import 'package:flutter/material.dart';
import 'package:ExamPrep/Navigation Drawer/backlayer.dart';
import 'package:ExamPrep/Navigation%20Drawer/bottom_navigation.dart';
import 'package:flutter_login/flutter_login.dart';

void main() => runApp(MaterialApp(
      home: LoginScreen(),
      debugShowCheckedModeBanner: false,
    ),
);

class LoginScreen extends StatelessWidget {
  Duration get loginTime => Duration(milliseconds: 2250);

  Future<String> _authUser(LoginData data) {
    print('Name: ${data.name}, Password: ${data.password}');
    return Future.delayed(loginTime).then((_) {
      return null;
    });
  }

  Future<String> _recoverPassword(String name) {
    print('Name: $name');
    return Future.delayed(loginTime).then((_) {
      return "This feature hasn't been developed yet";
    });
  }

  @override
  Widget build(BuildContext context) {
    final inputBorder = BorderRadius.vertical(
      bottom: Radius.circular(10.0),
      top: Radius.circular(20.0),
    );
    return FlutterLogin(
      title: 'ExamPrep',
      // logo: 'assets/images/ecorp-lightblue.png',
      onLogin: _authUser,
      onSignup: _authUser,
      onSubmitAnimationCompleted: () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => MainPage(),
        ));
      },
      onRecoverPassword: _recoverPassword,
      theme: LoginTheme(
        primaryColor: Colors.orange[600],
        accentColor: Colors.white,
        errorColor: Colors.deepOrange,
        pageColorDark: Colors.amber[300],
        ),
    );
  }
}

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

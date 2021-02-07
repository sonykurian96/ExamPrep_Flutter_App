import 'package:flutter/material.dart';

class BackLayer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.orange[800],Colors.amber]
          )
        ),
        child: Column(
          children: [
            SizedBox(height: 5,),
            ListTile(
              title: Text("Assessment",style: TextStyle(color: Colors.white)),
              leading: Icon(Icons.assessment,color: Colors.white,),
            ),
            Divider(color: Colors.white,),
            ListTile(
              title: Text("Settings",style: TextStyle(color: Colors.white)),
              leading: Icon(Icons.settings,color: Colors.white,),
            ),
            Divider(color: Colors.white,),
            ListTile(
              title: Text("Dark Mode Disabled",style: TextStyle(color: Colors.white)),
              leading: Icon(Icons.brightness_high,color: Colors.white,),
            ),
            Divider(color: Colors.white,),
          ],
        ),
      ),
    );

  }
}

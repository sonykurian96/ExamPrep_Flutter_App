import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BackLayer extends StatelessWidget {
  _launchURL1() async {
    const url = 'https://github.com/sonykurian96/ExamPrep_Flutter_App';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _launchURL2() async {
    const url =
        'https://github.com/sonykurian96/ExamPrep_Flutter_App/stargazers';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _launchURL3() async {
    const url = 'https://github.com/sonykurian96/ExamPrep_Flutter_App/issues';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
            gradient:
                LinearGradient(colors: [Colors.orange[800], Colors.amber])),
        child: Column(
          children: [
            ListTile(
              leading: CircleAvatar(
                child: Image.asset("assets/logo.jpeg"),
              ),
              title: Text(
                "ExamPrep",
                style: TextStyle(color: Colors.white),
              ),
              subtitle: Text("v2.0.0(pre-release)", style: TextStyle(color: Colors.white70)),
            ),
            Text("""An app which provides everything needed to 
crack exams with flying colours.""",
                style: TextStyle(color: Colors.white, fontSize: 17)),
            Padding(
                padding: EdgeInsets.fromLTRB(0, 15, 150, 0),
                child: Text("Developed by Tech elites.",
                    style: TextStyle(color: Colors.white, fontSize: 17))),
            SizedBox(
              height: 5,
            ),
            Divider(
              thickness: 0.5,
              color: Colors.white,
            ),
            InkWell(
              onTap: () {
                _launchURL1();
              },
              child: ListTile(
                leading: Icon(
                  Icons.code,
                  color: Colors.white,
                ),
                title: Text("Source code on GitHub",
                    style: TextStyle(color: Colors.white)),
              ),
            ),
            InkWell(
              onTap: () {
                _launchURL2();
              },
              child: ListTile(
                leading: Icon(
                  Icons.star,
                  color: Colors.white,
                ),
                title: Text("Star repo on GitHub",
                    style: TextStyle(color: Colors.white)),
              ),
            ),
            InkWell(
              onTap: () {
                _launchURL3();
              },
              child: ListTile(
                leading: Icon(
                  Icons.bug_report,
                  color: Colors.white,
                ),
                title: Text("Report issue on GitHub",
                    style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

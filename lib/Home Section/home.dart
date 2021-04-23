import 'package:flutter/material.dart';
import 'package:wave_transition/wave_transition.dart';
import 'pastPapers.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isSwitched = true;
  bool isAscending = false;
  int selectedRadio = 1;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 2, 0, 0),
              child: Text(
                "Last Moment Prep",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            Divider(thickness: 1),
            ListTile(
              leading: IconButton(
                  icon: Icon(
                    Icons.adjust,
                    color: Colors.orange[500],
                  ),
                  onPressed: () {}),
              title: Text("Sort Questions"),
              trailing: Switch(
                value: isSwitched,
                onChanged: (value) {
                  setState(() {
                    isSwitched = value;
                    print(isSwitched);
                  });
                },
                activeColor: Colors.amber[600],
                activeTrackColor: Colors.amber[200],
              ),
            ),
            RaisedButton(
              textColor: Colors.white,
              color: Colors.orange[500],
              child: Text("Go"),
              onPressed: () {
                Navigator.push(
                  context,
                  WaveTransition(
                    child: Paper(),
                    center: FractionalOffset(0.5, 0.3),
                    duration: Duration(milliseconds: 1500),
                    settings: RouteSettings(arguments: [selectedRadio,isAscending]),
                  ),
                );
              },
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30.0),
              ),
            ),
            Visibility(
              visible: isSwitched,
              child: Card(
                shadowColor: Colors.amber,
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                      child: Text(
                        "Select type of sorting: ",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Divider(
                      thickness: 1,
                    ),
                    RadioListTile(
                      controlAffinity: ListTileControlAffinity.trailing,
                      activeColor: Colors.orange[500],
                      title: Text("According to difficulty level"),
                      value: 1,
                      groupValue: selectedRadio,
                      onChanged: (value) {
                        setState(() {
                          selectedRadio = value;
                        });
                      },
                    ),
                    RadioListTile(
                      controlAffinity: ListTileControlAffinity.trailing,
                      activeColor: Colors.orange[500],
                      title: Text("According to weightage"),
                      value: 2,
                      groupValue: selectedRadio,
                      onChanged: (value) {
                        setState(() {
                          selectedRadio = value;
                        });
                      },
                    ),
                    Divider(
                      thickness: 1,
                    ),
                    ListTile(
                      title: Text("Descending order"),
                      trailing: Switch(
                        value: isAscending,
                        onChanged: (value) {
                          setState(() {
                            isAscending = value;
                          });
                        },
                        activeColor: Colors.amber[600],
                        activeTrackColor: Colors.amber[200],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class Settings extends StatefulWidget {

  final String title;
  Settings({
    Key key,
    this.title
  }) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.grey[200],
        title: Text(
          "Settings",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      backgroundColor: Colors.grey[200],

      body: Container(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(
              left: 20.0,
              right: 20.0,
              top: 25.0,
              bottom: 10.0,
            ),
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: <Widget>[
                Text("Nothing is here yet"),
                Text("Contribute to the Open source project at 'http://www.github.com/JideGuru/FlutterSuperHeroes'"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

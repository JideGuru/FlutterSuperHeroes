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
        child: Text("Settings is balck for now"),
      ),
    );
  }
}

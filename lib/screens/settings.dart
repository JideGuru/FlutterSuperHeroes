import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:superhero_app/main.dart';


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

  bool isSwitched;

  checkTheme() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String prefTheme = prefs.getString("theme") == null ? "light" : prefs.getString("theme");

    if(prefTheme == "light"){
      if(mounted){
        setState((){
          isSwitched = false;
        });
      }
    }else if(prefTheme == "dark"){
      if(mounted){
        setState((){
          isSwitched = true;
        });
      }
    }else{
      print("This is literally imposible to execute");
    }

  }

  @override
  void initState() {
    super.initState();
    checkTheme();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        elevation: 0.0,
        title: Text(
          "Settings",
          style: TextStyle(
          ),
        ),
      ),
      backgroundColor: Theme.of(context).backgroundColor,

      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[

            ListTile(
              title:Text(
                "Dark Mode",
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                ),
              ),

              subtitle: Text(
                  "Use the dark mode"
              ),


              trailing: Switch(
                value: isSwitched == null ? false : isSwitched,
                onChanged: (value) async{

                  SharedPreferences prefs = await SharedPreferences.getInstance();
                  String prefTheme = prefs.getString("theme") == null ? "light" : prefs.getString("theme");
                  if(prefTheme == "light"){
                    SharedPreferences preferences = await SharedPreferences.getInstance();
                    preferences.setString("theme", "dark");
                    MyApp.restartApp(context);

                  }else if(prefTheme == "dark"){
                    SharedPreferences preferences = await SharedPreferences.getInstance();
                    preferences.setString("theme", "light");
                    MyApp.restartApp(context);

                  }else{
                    print("shit happened");
                  }

                },
                activeColor: Theme.of(context).accentColor,
              ),


            ),
            Divider(),

            SizedBox(height: 10.0),
            Text("Contribute to the Open source project at 'http://www.github.com/JideGuru/FlutterSuperHeroes'"),
          ],
        ),
      ),
    );
  }
}
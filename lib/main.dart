import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:superhero_app/screens/home.dart';


void main() {

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.black, // navigation bar color
//    statusBarColor: Colors.blue, // status bar

  ));
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_) {
    runApp(MyApp());
  });


}

class MyApp extends StatelessWidget {

  var title = "Superheroes";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "$title",
      debugShowCheckedModeBanner: false,
      home: Home(
        title: "$title",
      ),

      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.white,
        accentColor: Colors.redAccent,
        textTheme: TextTheme(
          headline: TextStyle(
//              fontSize: 72.0,
//              fontWeight: FontWeight.bold,
          ),
          title: TextStyle(
//              fontSize: 36.0,
//              fontStyle: FontStyle.italic,
              color: Colors.black
          ),
          body1: TextStyle(
//              fontSize: 14.0,
//              fontFamily: 'Hind',
              color: Colors.black
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:superhero_app/screens/home.dart';


void main() {

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
//    systemNavigationBarColor: Colors.black, // navigation bar color
//    statusBarColor: Colors.grey[200], // status bar

  ));
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_) {
    runApp(MyApp());
  });


}

class MyApp extends StatefulWidget {

  // To restart App
  static restartApp(BuildContext context) {
    final _MyAppState state =
    context.ancestorStateOfType(const TypeMatcher<_MyAppState>());
    state.restartApp();
  }


  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  var title = "Superheroes";
  String theme;


  ThemeData light = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.grey[100],
    accentColor: Colors.redAccent,
    textTheme: TextTheme(
      headline: TextStyle(
      ),
      title: TextStyle(
      ),
      body1: TextStyle(
      ),
    ),
  );

  ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.black,
    accentColor: Colors.redAccent,
    backgroundColor: Colors.grey.shade900,
    textTheme: TextTheme(
      headline: TextStyle(
      ),
      title: TextStyle(
      ),
      body1: TextStyle(
      ),
    ),
  );


  //To Restart app
  Key key = UniqueKey();
  restartApp() {
    setState(() {
      key = UniqueKey();
    });
    checkTheme();
  }



  @override
  void initState() {
    super.initState();
    checkTheme();
  }

  checkTheme() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String prefTheme = prefs.getString("theme") == null ? "light" : prefs.getString("theme");
    print("THEME: $prefTheme");
    setState((){
      theme = prefTheme;
    });

  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      key: key,
      title: "$title",
      debugShowCheckedModeBanner: false,
      home: Home(
        title: "$title",
      ),

      theme: theme == "dark" ? dark : light,
    );
  }
}

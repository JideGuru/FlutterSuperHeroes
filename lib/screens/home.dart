import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:ui';
import 'package:http/http.dart' as http;
import 'package:superhero_app/podo/heroitem.dart';
import 'package:superhero_app/screens/search.dart';
import 'package:superhero_app/screens/settings.dart';
import 'package:superhero_app/widget/superhero.dart';

class Home extends StatefulWidget {
  final String title;
  Home({Key key, this.title}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List responseList;
  bool _loading;


  getHeroes() async{


    setState(() {
      _loading = true;
    });
    var url = 'https://akabab.github.io/superhero-api/api/all.json';
    var res = await http.get(url);
    List decodedJson = jsonDecode(res.body);


    int code = res.statusCode;
    if(code == 200){


      setState(() {
        responseList = decodedJson;
        _loading = false;
      });
    } else {
      print("Something went wrong");
      setState(() {
        _loading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getHeroes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          "${widget.title.toUpperCase()}",
          style: TextStyle(
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              responseList == null
                  ? print("Chill")
                  : showSearch(
                      context: context,
                      delegate: HeroSearch(all: responseList),
                    );
            },
            tooltip: "Search",
          ),
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              var router =
                  new MaterialPageRoute(builder: (BuildContext context) {
                return Settings(
                  title: widget.title,
                );
              });

              Navigator.of(context).push(router);
            },
            tooltip: "Search",
          ),
        ],
      ),
      backgroundColor: Theme.of(context).primaryColor,
      body: _loading
          ? Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).accentColor),
              ),
            )
          : Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: responseList == null ? 0 : responseList.length,
                itemBuilder: (BuildContext context, int index) {
                  HeroItem heroItem = HeroItem.fromJson(responseList[index]);

                  return Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: SuperHero(
                      name: heroItem.name,
                      fullName: heroItem.biography.fullName,
                      race: heroItem.appearance.race,
                      publisher: heroItem.biography.publisher,
                      id: heroItem.id,
                      hairColor: heroItem.appearance.hairColor,
                      gender: heroItem.appearance.gender,
                      img: heroItem.images.lg,
                    ),
                  );
                },
              ),
            ),
    );
  }
}

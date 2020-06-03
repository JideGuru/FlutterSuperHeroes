import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:superhero_app/podo/heroitem.dart';
import 'package:superhero_app/screens/search.dart';
import 'package:superhero_app/screens/settings.dart';
import 'package:superhero_app/util/const.dart';
import 'package:superhero_app/widget/superhero.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List responseList;
  bool _loading;

  getHeroes() async {
    setState(() {
      _loading = true;
    });
    var url = 'https://akabab.github.io/superhero-api/api/all.json';
    var res = await http.get(url);
    List decodedJson = jsonDecode(res.body);

    int code = res.statusCode;
    if (code == 200) {
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
        title: Text(
          "${Constants.appName}",
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              responseList == null
                  ? null
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
                return Settings();
              });

              Navigator.of(context).push(router);
            },
            tooltip: "Search",
          ),
        ],
      ),
      body: _loading
          ? _buildProgressIndicator()
          : _buildList(),
    );
  }

  _buildProgressIndicator(){
    return Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).accentColor),
      ),
    );
  }

  _buildList(){
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: responseList == null ? 0 : responseList.length,
        itemBuilder: (BuildContext context, int index) {
          HeroItem heroItem = HeroItem.fromJson(responseList[index]);

          return Padding(
            padding: const EdgeInsets.only(top: 5.0),
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
    );
  }
}

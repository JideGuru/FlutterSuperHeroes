import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:ui';
import 'package:http/http.dart' as http;
import 'package:superhero_app/podo/heroitem.dart';
import 'package:superhero_app/screens/search.dart';
import 'package:superhero_app/screens/settings.dart';
import 'package:superhero_app/widget/superhero.dart';


class Home extends StatefulWidget {
  final String title;
  Home({
    Key key,
    this.title
  }) : super(key: key);

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
    http.Response response = await http.get(url);
    List decodedJson = jsonDecode(res.body);

    int code = response.statusCode;
    if(code == 200){

      setState(() {
        responseList = decodedJson;
        _loading = false;
      });
    }else{
      print("Something went wrong");
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
        backgroundColor: Colors.grey[200],
        title: Text(
          "${widget.title.toUpperCase()}",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: (){

              responseList == null ? print("Chill")
                  :
              showSearch(
                context: context,
                delegate: HeroSearch(all: responseList),
              );
            },
            tooltip: "Search",
            color: Colors.black,
          ),
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: (){
              var router = new MaterialPageRoute(
                  builder: (BuildContext context) {
                    return Settings(title: widget.title,);
                  }
              );

              Navigator.of(context).push(router);
            },
            tooltip: "Search",
            color: Colors.black,
          ),
        ],
      ),
      backgroundColor: Colors.grey[200],

      body: _loading
          ? Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
        ),
      )
          :Padding(
        padding: EdgeInsets.all(10.0),
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: responseList == null ? 0 : responseList.length,
          itemBuilder: (BuildContext context, int index) {
            HeroItem heroItem = HeroItem.fromJson(responseList[index]);

            return SuperHero(
              name: heroItem.name,
              fullName: heroItem.biography.fullName,
              race: heroItem.appearance.race,
              publisher: heroItem.biography.publisher,
              id: heroItem.id,
              hairColor: heroItem.appearance.hairColor,
              gender: heroItem.appearance.gender,
              img: heroItem.images.lg,
            );
          },

        ),
      ),
    );
  }
}

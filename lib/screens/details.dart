import 'package:flutter/material.dart';
import 'package:superhero_app/podo/heroitem.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:ui';
import 'package:percent_indicator/percent_indicator.dart';

class Details extends StatefulWidget {
  var title;
  var id;
  var img;
  Details({
    Key key,
    this.title, this.id, this.img
  }) : super(key: key);


  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {

  bool _loading;
  HeroItem heroItem;
  getHero() async{

    setState(() {
      _loading = true;
    });
    var url = 'https://akabab.github.io/superhero-api/api/id/${widget.id}.json';
    var res = await http.get(url);
    http.Response response = await http.get(url);
    var decodedJson = jsonDecode(res.body);

    print(decodedJson);
    int code = response.statusCode;
    if(code == 200){

      setState(() {
        heroItem = HeroItem.fromJson(decodedJson);
        _loading = false;
      });
    }else{
      print("Something went wrong");
    }

  }


  @override
  void initState() {
    super.initState();
    getHero();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body:  _loading
          ? Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).accentColor),
        ),
      )
          :SingleChildScrollView(
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

              SizedBox(height: 40.0,),

              Container(
                child: CircleAvatar(
                  backgroundColor: Theme.of(context).accentColor,
                  backgroundImage: NetworkImage(
                    '${widget.img}',
                  ),
                  radius: 70.0,
                ),
              ),

//              Container(
//                child: Image.network(
//                  "${widget.img}",
//                  fit: BoxFit.fill,
//
//                ),
//                width: MediaQuery.of(context).size.width,
//                height: MediaQuery.of(context).size.height /1.5,
//              ),

              SizedBox(height: 13.0,),
              Text(
                "${heroItem.name}",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w900,
                ),
                textAlign: TextAlign.left,
              ),

              Text(
                "${heroItem.biography.fullName}",
                style: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.left,
              ),


              SizedBox(height: 30.0, ),

              Container(
                width: MediaQuery.of(context).size.width,
                child: Text(
                  "Biography",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w900,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              Divider(),
              SizedBox(height: 10.0, ),


              Container(
                width: MediaQuery.of(context).size.width,
                child: Text(
                  "Alter Ego(s): ${heroItem.biography.alterEgos}",
                  style: TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),

              Container(
                width: MediaQuery.of(context).size.width,
                child: Text(
                  "Aliases: ${heroItem.biography.aliases.toString()}",
                  style: TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),

              Container(
                width: MediaQuery.of(context).size.width,
                child: Text(
                  "Place of birth: ${heroItem.biography.placeOfBirth}",
                  style: TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),

              Container(
                width: MediaQuery.of(context).size.width,
                child: Text(
                  "First appearance: ${heroItem.biography.firstAppearance}",
                  style: TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),

              Container(
                width: MediaQuery.of(context).size.width,
                child: Text(
                  "Creator: ${heroItem.biography.publisher}",
                  style: TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),

              SizedBox(height: 20.0, ),

              Container(
                width: MediaQuery.of(context).size.width,
                child: Text(
                  "Appearance",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w900,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              Divider(),
              SizedBox(height: 10.0, ),

              Container(
                width: MediaQuery.of(context).size.width,
                child: Text(
                  "Gender: ${heroItem.appearance.gender}",
                  style: TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),

              Container(
                width: MediaQuery.of(context).size.width,
                child: Text(
                  "Race: ${heroItem.appearance.race}",
                  style: TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),


              Container(
                width: MediaQuery.of(context).size.width,
                child: Text(
                  "Height: ${heroItem.appearance.height}",
                  style: TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),

              Container(
                width: MediaQuery.of(context).size.width,
                child: Text(
                  "Weight: ${heroItem.appearance.weight}",
                  style: TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),

              Container(
                width: MediaQuery.of(context).size.width,
                child: Text(
                  "Eye Color: ${heroItem.appearance.eyeColor}",
                  style: TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),

              Container(
                width: MediaQuery.of(context).size.width,
                child: Text(
                  "Hair Color: ${heroItem.appearance.hairColor}",
                  style: TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),


              SizedBox(height: 20.0, ),

              Container(
                width: MediaQuery.of(context).size.width,
                child: Text(
                  "Work",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w900,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              Divider(),
              SizedBox(height: 10.0, ),

              Container(
                width: MediaQuery.of(context).size.width,
                child: Text(
                  "Occupation: ${heroItem.work.occupation}",
                  style: TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),

              Container(
                width: MediaQuery.of(context).size.width,
                child: Text(
                  "Base: ${heroItem.work.base}",
                  style: TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),

              SizedBox(height: 20.0, ),

              Container(
                width: MediaQuery.of(context).size.width,
                child: Text(
                  "Power Stats",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w900,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              Divider(),
              SizedBox(height: 10.0, ),


              Container(
                width: MediaQuery.of(context).size.width,
                child: Text(
                  "Intelligence",
                  style: TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),

              LinearPercentIndicator(
                width: MediaQuery.of(context).size.width - 50,
                animation: true,
                lineHeight: 10.0,
                animationDuration: 5000,
                percent: heroItem.powerstats.intelligence.toDouble()/100.0,
                center: Text(
                  "${heroItem.powerstats.intelligence.toDouble()}",
                  style: TextStyle(fontSize: 8.0, color: Colors.white),
                ),
                linearStrokeCap: LinearStrokeCap.roundAll,
                progressColor: Colors.blue,
              ),

              SizedBox(height: 5.0),

              Container(
                width: MediaQuery.of(context).size.width,
                child: Text(
                  "Strength",
                  style: TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),

              LinearPercentIndicator(
                width: MediaQuery.of(context).size.width - 50,
                animation: true,
                lineHeight: 10.0,
                animationDuration: 5000,
                percent: heroItem.powerstats.strength.toDouble()/100.0,
                center: Text(
                  "${heroItem.powerstats.strength.toDouble()}",
                  style: TextStyle(fontSize: 8.0, color: Colors.white),
                ),
                linearStrokeCap: LinearStrokeCap.roundAll,
                progressColor: Colors.red,
              ),

              SizedBox(height: 5.0),

              Container(
                width: MediaQuery.of(context).size.width,
                child: Text(
                  "Speed",
                  style: TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),

              LinearPercentIndicator(
                width: MediaQuery.of(context).size.width - 50,
                animation: true,
                lineHeight: 10.0,
                animationDuration: 5000,
                percent: heroItem.powerstats.speed.toDouble()/100.0,
                center: Text(
                  "${heroItem.powerstats.speed.toDouble()}",
                  style: TextStyle(fontSize: 8.0, color: Colors.white),
                ),
                linearStrokeCap: LinearStrokeCap.roundAll,
                progressColor: Colors.green,
              ),


              SizedBox(height: 5.0),

              Container(
                width: MediaQuery.of(context).size.width,
                child: Text(
                  "Durability",
                  style: TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),

              LinearPercentIndicator(
                width: MediaQuery.of(context).size.width - 50,
                animation: true,
                lineHeight: 10.0,
                animationDuration: 5000,
                percent: heroItem.powerstats.durability.toDouble()/100.0,
                center: Text(
                  "${heroItem.powerstats.durability.toDouble()}",
                  style: TextStyle(fontSize: 8.0, color: Colors.white),
                ),
                linearStrokeCap: LinearStrokeCap.roundAll,
                progressColor: Colors.orange,
              ),


              SizedBox(height: 5.0),

              Container(
                width: MediaQuery.of(context).size.width,
                child: Text(
                  "Power",
                  style: TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),


              LinearPercentIndicator(
                width: MediaQuery.of(context).size.width - 50,
                animation: true,
                lineHeight: 10.0,
                animationDuration: 5000,
                percent: heroItem.powerstats.power.toDouble()/100.0,
                center: Text(
                  "${heroItem.powerstats.power.toDouble()}",
                  style: TextStyle(fontSize: 8.0, color: Colors.white),
                ),
                linearStrokeCap: LinearStrokeCap.roundAll,
                progressColor: Colors.cyan,
              ),


              SizedBox(height: 5.0),

              Container(
                width: MediaQuery.of(context).size.width,
                child: Text(
                  "Combat",
                  style: TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),

              LinearPercentIndicator(
                width: MediaQuery.of(context).size.width - 50,
                animation: true,
                lineHeight: 10.0,
                animationDuration: 5000,
                percent: heroItem.powerstats.combat.toDouble()/100.0,
                center: Text(
                  "${heroItem.powerstats.combat.toDouble()}",
                  style: TextStyle(fontSize: 8.0, color: Colors.black),
                ),
                linearStrokeCap: LinearStrokeCap.roundAll,
                progressColor: Colors.yellow,
              ),




              SizedBox(height: 20.0, ),


              Container(
                width: MediaQuery.of(context).size.width,
                child: Text(
                  "Connections",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w900,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              Divider(),
              SizedBox(height: 10.0, ),

              Container(
                width: MediaQuery.of(context).size.width,
                child: Text(
                  "Team Affiliation: ${heroItem.connections.groupAffiliation}",
                  style: TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),

              Container(
                width: MediaQuery.of(context).size.width,
                child: Text(
                  "Relatives: ${heroItem.connections.relatives}",
                  style: TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}

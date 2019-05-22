import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:superhero_app/podo/heroitem.dart';
import 'package:superhero_app/widget/superhero_avatar.dart';

class Details extends StatefulWidget {
  final title;
  final id;
  final img;
  final name;

  Details({Key key, this.title, this.id, this.img, this.name})
      : super(key: key);

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  bool _loading;
  HeroItem heroItem;
  getHero() async {
    setState(() {
      _loading = true;
    });
    var url = 'https://akabab.github.io/superhero-api/api/id/${widget.id}.json';
    var res = await http.get(url);
    http.Response response = await http.get(url);
    var decodedJson = jsonDecode(res.body);

    print(decodedJson);
    int code = response.statusCode;
    if (code == 200) {
      setState(() {
        heroItem = HeroItem.fromJson(decodedJson);
        _loading = false;
      });
    } else {
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
      appBar: AppBar(
        title: Text(widget.name),
      ),
      backgroundColor: Theme.of(context).primaryColor,
      body: _loading
          ? Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).accentColor),
              ),
            )
          : SuperheroDetails(widget: widget, heroItem: heroItem),
    );
  }
}

class SuperheroDetails extends StatefulWidget {
  const SuperheroDetails({
    Key key,
    @required this.widget,
    @required this.heroItem,
  }) : super(key: key);

  final Details widget;
  final HeroItem heroItem;

  @override
  _SuperheroDetailsState createState() => _SuperheroDetailsState();
}

class _SuperheroDetailsState extends State<SuperheroDetails> {
  Map<String, bool> _categoryExpansionStateMap = Map<String, bool>();
  bool isExpandedo;

  @override
  void initState() {
    super.initState();

    _categoryExpansionStateMap = {
      "Biography": true,
      "Appearance": false,
      "Work": false,
      "Power Stats": false,
      "Connections": false,
    };

    isExpandedo = false;
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(16.0),
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: <Widget>[
            SuperheroAvatar(
              img: widget.widget.img,
              radius: 50.0,
            ),
            SizedBox(
              height: 13.0,
            ),
            Text(
              widget.heroItem.name,
              style: textTheme.title,
            ),
            Text(
              widget.heroItem.biography.fullName.isEmpty
                  ? widget.heroItem.name
                  : widget.heroItem.biography.fullName,
              style: textTheme.subtitle.copyWith(
                fontWeight: FontWeight.w300,
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            ExpansionPanelList(
              expansionCallback: (int index, bool isExpanded) {
                setState(() {
                  _categoryExpansionStateMap[_categoryExpansionStateMap.keys
                      .toList()[index]] = !isExpanded;
                });
              },
              children: <ExpansionPanel>[
                ExpansionPanel(
                    headerBuilder: (BuildContext context, bool isExpanded) {
                      return ListTile(
                          title: Text(
                        "Biography",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ));
                    },
                    body: Biography(
                      heroItem: widget.heroItem,
                    ),
                    isExpanded: _categoryExpansionStateMap["Biography"]),
                ExpansionPanel(
                    headerBuilder: (BuildContext context, bool isExpanded) {
                      return ListTile(
                          title: Text(
                        "Appearance",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ));
                    },
                    body: Appearance(
                      heroItem: widget.heroItem,
                    ),
                    isExpanded: _categoryExpansionStateMap["Appearance"]),
                ExpansionPanel(
                    headerBuilder: (BuildContext context, bool isExpanded) {
                      return ListTile(
                          title: Text(
                        "Work",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ));
                    },
                    body: Work(
                      heroItem: widget.heroItem,
                    ),
                    isExpanded: _categoryExpansionStateMap["Work"]),
                ExpansionPanel(
                    headerBuilder: (BuildContext context, bool isExpanded) {
                      return ListTile(
                          title: Text(
                        "Power Stats",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ));
                    },
                    body: PowerStats(
                      heroItem: widget.heroItem,
                    ),
                    isExpanded: _categoryExpansionStateMap["Power Stats"]),
                ExpansionPanel(
                    headerBuilder: (BuildContext context, bool isExpanded) {
                      return ListTile(
                          title: Text(
                        "Connections",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ));
                    },
                    body: Connections(
                      heroItem: widget.heroItem,
                    ),
                    isExpanded: _categoryExpansionStateMap["Connections"]),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Biography extends StatelessWidget {
  final HeroItem heroItem;

  const Biography({Key key, @required this.heroItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: Text(
            "Alter Ego(s)".toUpperCase(),
            style: Theme.of(context)
                .textTheme
                .caption
                .copyWith(fontWeight: FontWeight.w500,),
          ),
          subtitle: Text(
            heroItem.biography.alterEgos,
            style: TextStyle(fontWeight: FontWeight.w300,),
          ),
        ),
        ListTile(
          title: Text(
            "Aliases".toUpperCase(),
            style: Theme.of(context)
                .textTheme
                .caption
                .copyWith(fontWeight: FontWeight.w500,),
          ),
          subtitle: Text(
            heroItem.biography.aliases
                .toString()
                .replaceAll("[", "")
                .replaceAll("]", ""),
            style: TextStyle(fontWeight: FontWeight.w300),
          ),
        ),
        ListTile(
          title: Text(
            "Place of birth".toUpperCase(),
            style: Theme.of(context)
                .textTheme
                .caption
                .copyWith(fontWeight: FontWeight.w500),
          ),
          subtitle: Text(
            heroItem.biography.placeOfBirth,
            style: TextStyle(fontWeight: FontWeight.w300),
          ),
        ),
        ListTile(
          title: Text(
            "First Appearance".toUpperCase(),
            style: Theme.of(context)
                .textTheme
                .caption
                .copyWith(fontWeight: FontWeight.w500),
          ),
          subtitle: Text(
            heroItem.biography.firstAppearance,
            style: TextStyle(fontWeight: FontWeight.w300),
          ),
        ),
        ListTile(
          title: Text(
            "Creator".toUpperCase(),
            style: Theme.of(context)
                .textTheme
                .caption
                .copyWith(fontWeight: FontWeight.w500),
          ),
          subtitle: Text(
            heroItem.biography.publisher,
            style: TextStyle(fontWeight: FontWeight.w300),
          ),
        ),
      ],
    );
  }
}

class Appearance extends StatelessWidget {
  final HeroItem heroItem;

  const Appearance({Key key, @required this.heroItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: Text(
            "Gender".toUpperCase(),
            style: Theme.of(context)
                .textTheme
                .caption
                .copyWith(fontWeight: FontWeight.w500),
          ),
          subtitle: Text(
            heroItem.appearance.gender,
            style: TextStyle(fontWeight: FontWeight.w300),
          ),
        ),
        ListTile(
          title: Text(
            "Race".toUpperCase(),
            style: Theme.of(context)
                .textTheme
                .caption
                .copyWith(fontWeight: FontWeight.w500),
          ),
          subtitle: Text(
            heroItem.appearance.race
                .toString()
                .replaceAll("[", "")
                .replaceAll("]", ""),
            style: TextStyle(fontWeight: FontWeight.w300),
          ),
        ),
        ListTile(
          title: Text(
            "Height".toUpperCase(),
            style: Theme.of(context)
                .textTheme
                .caption
                .copyWith(fontWeight: FontWeight.w500),
          ),
          subtitle: Text(
            heroItem.appearance.height
                .toString()
                .replaceAll("[", "")
                .replaceAll("]", ""),
            style: TextStyle(fontWeight: FontWeight.w300),
          ),
        ),
        ListTile(
          title: Text(
            "Weight".toUpperCase(),
            style: Theme.of(context)
                .textTheme
                .caption
                .copyWith(fontWeight: FontWeight.w500),
          ),
          subtitle: Text(
            heroItem.appearance.weight
                .toString()
                .replaceAll("[", "")
                .replaceAll("]", ""),
            style: TextStyle(fontWeight: FontWeight.w300),
          ),
        ),
        ListTile(
          title: Text(
            "Eye Color".toUpperCase(),
            style: Theme.of(context)
                .textTheme
                .caption
                .copyWith(fontWeight: FontWeight.w500),
          ),
          subtitle: Text(
            heroItem.appearance.eyeColor,
            style: TextStyle(fontWeight: FontWeight.w300),
          ),
        ),
      ],
    );
  }
}

class Work extends StatelessWidget {
  final HeroItem heroItem;

  const Work({Key key, @required this.heroItem}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        "Base".toUpperCase(),
        style: Theme.of(context)
            .textTheme
            .caption
            .copyWith(fontWeight: FontWeight.w500),
      ),
      subtitle: Text(
        heroItem.work.base,
        style: TextStyle(fontWeight: FontWeight.w300),
      ),
    );
  }
}

class PowerStats extends StatelessWidget {
  final HeroItem heroItem;

  const PowerStats({Key key, @required this.heroItem}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: Text(
            "Intelligence".toUpperCase() +
                " - ${heroItem.powerstats.intelligence}%",
            style: Theme.of(context)
                .textTheme
                .caption
                .copyWith(fontWeight: FontWeight.w500, ),
          ),
          subtitle: LinearPercentIndicator(
            animation: true,
            lineHeight: 15.0,
            animationDuration: 5000,
            percent: heroItem.powerstats.intelligence.toDouble() / 100.0,
            linearStrokeCap: LinearStrokeCap.roundAll,
            progressColor: Colors.blue,
          ),
        ),
        ListTile(
          title: Text(
            "Strength".toUpperCase() + " - ${heroItem.powerstats.strength}%",
            style: Theme.of(context)
                .textTheme
                .caption
                .copyWith(fontWeight: FontWeight.w500,),
          ),
          subtitle: LinearPercentIndicator(
            animation: true,
            lineHeight: 15.0,
            animationDuration: 5000,
            percent: heroItem.powerstats.strength.toDouble() / 100.0,
            linearStrokeCap: LinearStrokeCap.roundAll,
            progressColor: Colors.orange,
          ),
        ),
        ListTile(
          title: Text(
            "Speed".toUpperCase() + " - ${heroItem.powerstats.speed}%",
            style: Theme.of(context)
                .textTheme
                .caption
                .copyWith(fontWeight: FontWeight.w500,),
          ),
          subtitle: LinearPercentIndicator(
            animation: true,
            lineHeight: 15.0,
            animationDuration: 5000,
            percent: heroItem.powerstats.speed.toDouble() / 100.0,
            linearStrokeCap: LinearStrokeCap.roundAll,
            progressColor: Colors.green,
          ),
        ),
        ListTile(
          title: Text(
            "Durability".toUpperCase() +
                " - ${heroItem.powerstats.durability}%",
            style: Theme.of(context)
                .textTheme
                .caption
                .copyWith(fontWeight: FontWeight.w500,),
          ),
          subtitle: LinearPercentIndicator(
            animation: true,
            lineHeight: 15.0,
            animationDuration: 5000,
            percent: heroItem.powerstats.durability.toDouble() / 100.0,
            linearStrokeCap: LinearStrokeCap.roundAll,
            progressColor: Colors.orangeAccent,
          ),
        ),
        ListTile(
          title: Text(
            "Power".toUpperCase() + " - ${heroItem.powerstats.power}%",
            style: Theme.of(context)
                .textTheme
                .caption
                .copyWith(fontWeight: FontWeight.w500,),
          ),
          subtitle: LinearPercentIndicator(
            animation: true,
            lineHeight: 15.0,
            animationDuration: 5000,
            percent: heroItem.powerstats.power.toDouble() / 100.0,
            linearStrokeCap: LinearStrokeCap.roundAll,
            progressColor: Colors.red,
          ),
        ),
        ListTile(
          title: Text(
            "Combat".toUpperCase() + " - ${heroItem.powerstats.combat}%",
            style: Theme.of(context)
                .textTheme
                .caption
                .copyWith(fontWeight: FontWeight.w500,),
          ),
          subtitle: LinearPercentIndicator(
            animation: true,
            lineHeight: 15.0,
            animationDuration: 5000,
            percent: heroItem.powerstats.combat.toDouble() / 100.0,
            linearStrokeCap: LinearStrokeCap.roundAll,
            progressColor: Colors.black,
          ),
        ),
      ],
    );
  }
}

class Connections extends StatelessWidget {
  final HeroItem heroItem;

  const Connections({Key key, @required this.heroItem}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: Text(
            "Team Affiliation".toUpperCase(),
            style: Theme.of(context)
                .textTheme
                .caption
                .copyWith(fontWeight: FontWeight.w500,),
          ),
          subtitle: Text(
            heroItem.connections.groupAffiliation,
            style: TextStyle(fontWeight: FontWeight.w300,),
          ),
        ),
        ListTile(
          title: Text(
            "Relatives".toUpperCase(),
            style: Theme.of(context)
                .textTheme
                .caption
                .copyWith(fontWeight: FontWeight.w500,),
          ),
          subtitle: Text(
            heroItem.connections.relatives
                .toString()
                .replaceAll("[", "")
                .replaceAll("]", ""),
            style: TextStyle(fontWeight: FontWeight.w300,),
          ),
        ),
        SizedBox(height: 10.0),
      ],
    );
  }
}

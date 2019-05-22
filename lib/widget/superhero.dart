import 'package:flutter/material.dart';
import 'package:superhero_app/screens/details.dart';
import 'package:superhero_app/widget/superhero_avatar.dart';

class SuperHero extends StatelessWidget {
  var id;
  String name;
  String fullName;
  var img;
  var race;
  var gender;
  var hairColor;
  var publisher;

  SuperHero({
    Key key,
    @required this.id,
    @required this.name,
    @required this.fullName,
    @required this.img,
    @required this.race,
    @required this.gender,
    @required this.hairColor,
    @required this.publisher,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return InkWell(
      onTap: () {
        var router = new MaterialPageRoute(builder: (BuildContext context) {
          return Details(img: img, id: id, name: name);
        });

        Navigator.of(context).push(router);
      },
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Container(
            child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: IntrinsicHeight(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    width: 12.0,
                  ),
                  SuperheroAvatar(img: img),
                  SizedBox(
                    width: 24.0,
                  ),
                  Expanded(
                    child: Container(
                      // color: Colors.indigo,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "$name",
                            style: textTheme.title,
                          ),
                          Text(
                            fullName.isEmpty ? name : fullName,
                            style: textTheme.subtitle.copyWith(
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.book,
                                size: 18.0,
                              ),
                              SizedBox(
                                width: 2.0,
                              ),
                              Text(
                                "$publisher",
                                style: textTheme.caption,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ]),
          ),
        )),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:superhero_app/screens/details.dart';

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
          return Details(img: img, id: id);
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
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.transparent,
                        ),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              offset: new Offset(0.0, 0.0),
                              blurRadius: 2.0,
                              spreadRadius: 0.0),
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: CircleAvatar(
                        radius: 40.0,
                        backgroundImage: NetworkImage(
                          "$img",
                        ),
                      ),
                    ),
                  ),
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

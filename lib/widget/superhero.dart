import 'package:flutter/material.dart';
import 'package:superhero_app/screens/details.dart';

class SuperHero extends StatelessWidget {
  var id;
  var name;
  var fullName;
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
    return Padding(
      padding: EdgeInsets.only(right: 5.0, left: 5.0, top: 5.0),
      child: InkWell(
        onTap: () {
          var router = new MaterialPageRoute(builder: (BuildContext context) {
            return Details(img: img, id: id);
          });

          Navigator.of(context).push(router);
        },
        child: Card(
          elevation: 6.0,
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Container(
            color: Colors.amber,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: CircleAvatar(
                    radius: 50.0,
                    backgroundImage: NetworkImage(
                      "$img",
                    ),
                  ),
                ),
                Container(
                  color: Colors.green,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "$name",
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "$fullName",
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w300,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      // SizedBox(height: 10.0),
                      // Container(
                      //   alignment: Alignment.topLeft,
                      //   child: Text(
                      //     "Race: ${race == null ? "Unknown" : race}",
                      //     style: TextStyle(
                      //       fontSize: 13.0,
                      //       fontWeight: FontWeight.w500,
                      //     ),
                      //     textAlign: TextAlign.left,
                      //   ),
                      // ),
                      // Container(
                      //   alignment: Alignment.topLeft,
                      //   child: Text(
                      //     "Gender: $gender",
                      //     style: TextStyle(
                      //       fontSize: 13.0,
                      //       fontWeight: FontWeight.w500,
                      //     ),
                      //     textAlign: TextAlign.left,
                      //   ),
                      // ),
                      // Container(
                      //   alignment: Alignment.topLeft,
                      //   child: Text(
                      //     "Hair Color: $hairColor",
                      //     style: TextStyle(
                      //       fontSize: 13.0,
                      //       fontWeight: FontWeight.w500,
                      //     ),
                      //     textAlign: TextAlign.left,
                      //   ),
                      // ),
                      Container(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "By $publisher",
                          style: TextStyle(
                            fontSize: 13.0,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

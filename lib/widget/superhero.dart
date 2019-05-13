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
        onTap: (){
          var router = new MaterialPageRoute(
              builder: (BuildContext context) {
                return Details(img: img, id: id);
              }
          );

          Navigator.of(context).push(router);
        },
        child: Card(
          elevation: 6.0,
          child: Row(
            children: <Widget>[


              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  bottomLeft: Radius.circular(20.0),
                ),
                child: SizedBox(
                  child: Image.network(
                    "$img",
                    fit: BoxFit.fill,

                  ),
                  width: MediaQuery.of(context).size.width /2.7,
                ),
              ),


              Padding(
                padding: EdgeInsets.only(
                  left: 20.0,
                  right: 10.0,
                  top: 20.0,
                  bottom: 20.0,
                ),
                child: Container(
                  width: MediaQuery.of(context).size.width /2.3,
                  child: Align(
                    child: Column(
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


                        SizedBox(height: 10.0),

                        Container(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "$fullName",
                            style: TextStyle(
                              fontSize: 13.0,
                              fontWeight: FontWeight.w700,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),

                        SizedBox(height: 10.0),

                        Container(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Race: ${race == null ? "Unknown" : race}",
                            style: TextStyle(
                              fontSize: 13.0,
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),


                        Container(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Gender: $gender",
                            style: TextStyle(
                              fontSize: 13.0,
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),


                        Container(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Hair Color: $hairColor",
                            style: TextStyle(
                              fontSize: 13.0,
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),


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
                ),
              ),
            ],
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              bottomLeft: Radius.circular(20.0),
            ),
          ),
        ),
      ),
    );
  }
}

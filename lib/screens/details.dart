import 'package:flutter/material.dart';

class Details extends StatefulWidget {
  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              child: Image.network(
                "$img",
                fit: BoxFit.fill,

              ),
              width: MediaQuery.of(context).size.width,
            ),
          ],
        ),
      ),
    );
  }
}

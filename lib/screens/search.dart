import 'package:flutter/material.dart';
import 'package:superhero_app/podo/heroitem.dart';
import 'package:superhero_app/widget/superhero.dart';

class HeroSearch extends SearchDelegate {
  final List all;

  HeroSearch({@required this.all});

  @override
  ThemeData appBarTheme(BuildContext context) {
    assert(context != null);
    final ThemeData theme = Theme.of(context);
    assert(theme != null);
    return theme;
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    var query1;
    var query2 = " ";
    if (query.length != 0) {
      query1 = query.toLowerCase();
      query2 = query1[0].toUpperCase() + query1.substring(1);
    }

    //Search in the json for the query entered
    var search = all.where((hero) => hero['name'].contains(query2)).toList();

    return search == null
        ? _buildProgressIndicator()
        : _buildSearchList(search);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    var query1;
    var query2 = "";
    if (query.length != 0) {
      query1 = query.toLowerCase();
      query2 = query1[0].toUpperCase() + query1.substring(1);
    }

    var search;

    if (query2.isNotEmpty) {
      search = all.where((hero) => hero['name'].contains(query2)).toList();
    } else {
      search = all;
    }

    return search == null
        ? _buildProgressIndicator()
        : _buildSearchList(search);
  }

  _buildSearchList(List search) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: search == null ? 0 : search.length,
        itemBuilder: (BuildContext context, int position) {
          HeroItem heroItem = HeroItem.fromJson(search[position]);

          return Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: SuperHero(
              heroItem: heroItem,
            ),
          );
        },
      ),
    );
  }

  _buildProgressIndicator() {
    return Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
      ),
    );
  }
}

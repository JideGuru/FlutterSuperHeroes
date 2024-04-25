import 'package:flutter/material.dart';
import 'package:superhero_app/podo/hero_item.dart';
import 'package:superhero_app/widget/superhero.dart';

class HeroSearch extends SearchDelegate {
  HeroSearch({required this.allHeroes});

  final List allHeroes;

  @override
  ThemeData appBarTheme(BuildContext context) {
    final ThemeData theme = Theme.of(context);
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
    var foundHeroes =
        allHeroes.where((hero) => hero['name'].contains(query2)).toList();

    return foundHeroes.isEmpty
        ? _buildProgressIndicator()
        : _buildSearchList(foundHeroes);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    var query1;
    var query2 = "";
    if (query.length != 0) {
      query1 = query.toLowerCase();
      query2 = query1[0].toUpperCase() + query1.substring(1);
    }

    var foundHeroes;

    if (query2.isNotEmpty) {
      foundHeroes =
          allHeroes.where((hero) => hero['name'].contains(query2)).toList();
    } else {
      foundHeroes = allHeroes;
    }

    return foundHeroes == null
        ? _buildProgressIndicator()
        : _buildSearchList(foundHeroes);
  }

  Widget _buildSearchList(List foundHeroes) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: foundHeroes.isEmpty ? 0 : foundHeroes.length,
        itemBuilder: (BuildContext context, int position) {
          HeroItem heroItem = HeroItem.fromJson(foundHeroes[position]);

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

  Widget _buildProgressIndicator() {
    return Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
      ),
    );
  }
}

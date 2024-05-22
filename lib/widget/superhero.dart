import 'package:flutter/material.dart';
import 'package:superhero_app/podo/hero_item.dart';
import 'package:superhero_app/screens/details.dart';
import 'package:superhero_app/widget/superhero_avatar.dart';

class SuperHero extends StatelessWidget {
  const SuperHero({
    super.key,
    required this.heroItem,
  });

  final HeroItem heroItem;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return InkWell(
      onTap: () {
        var router = MaterialPageRoute(builder: (BuildContext context) {
          return Details(
            heroItem: heroItem,
          );
        });

        Navigator.of(context).push(router);
      },
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const SizedBox(
                  width: 12.0,
                ),
                Hero(
                  tag: heroItem.id,
                  child: SuperheroAvatar(img: heroItem.images.md),
                ),
                const SizedBox(
                  width: 24.0,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        heroItem.name,
                        style: textTheme.titleLarge,
                      ),
                      Text(
                        heroItem.biography.fullName.isEmpty
                            ? heroItem.name
                            : heroItem.biography.fullName,
                        style: textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          const Icon(
                            Icons.book,
                            size: 18.0,
                          ),
                          const SizedBox(
                            width: 2.0,
                          ),
                          Flexible(
                            child: Text(
                              heroItem.biography.publisher,
                              style: textTheme.bodySmall,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

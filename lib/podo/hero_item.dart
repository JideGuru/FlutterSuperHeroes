import 'package:superhero_app/podo/appearance.dart';
import 'package:superhero_app/podo/biography.dart';
import 'package:superhero_app/podo/connections.dart';
import 'package:superhero_app/podo/images.dart';
import 'package:superhero_app/podo/powerstats.dart';
import 'package:superhero_app/podo/work.dart';

class HeroItem {
  HeroItem({
    required this.id,
    required this.name,
    required this.slug,
    required this.powerstats,
    required this.appearance,
    required this.biography,
    required this.work,
    required this.connections,
    required this.images,
  });

  final int id;
  final String name;
  final String slug;
  final Powerstats powerstats;
  final Appearance appearance;
  final Biography biography;
  final Work work;
  final Connections connections;
  final Images images;

  factory HeroItem.fromJson(Map<String, dynamic> json) {
    return HeroItem(
        id: json['id'],
        name: json['name'],
        slug: json['slug'],
        powerstats: json['powerstats'] != null
            ? Powerstats.fromJson(json['powerstats'])
            : Powerstats(
                intelligence: 0,
                strength: 0,
                speed: 0,
                durability: 0,
                power: 0,
                combat: 0,
              ),
        appearance: json['appearance'] != null
            ? Appearance.fromJson(json['appearance'])
            : Appearance(
                gender: "male",
                race: "Terran",
                height: ["175"],
                weight: ["65"],
                eyeColor: "greyish blue",
                hairColor: "brown",
              ),
        biography: json['biography'] != null
            ? new Biography.fromJson(json['biography'])
            : Biography(
                fullName: "Max Mustermann",
                alterEgos: "MusterMax",
                aliases: ["MannerMust"],
                placeOfBirth: "Stuttgart",
                firstAppearance: "Kanada",
                publisher: "None",
                alignment: "Straight"),
        work: json['work'] != null
            ? new Work.fromJson(json['work'])
            : Work(occupation: "Reporter", base: "Mums Basement"),
        connections: json['connections'] != null
            ? new Connections.fromJson(json['connections'])
            : Connections(
                groupAffiliation: "bored apes", relatives: "Mow the Cow"),
        images: json['images'] != null
            ? new Images.fromJson(json['images'])
            : Images(xs: "UNDEF", sm: "UNDEF", md: "UNDEF", lg: "UNDEF"));
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['powerstats'] = this.powerstats.toJson();
    data['appearance'] = this.appearance.toJson();
    data['biography'] = this.biography.toJson();
    data['work'] = this.work.toJson();
    data['connections'] = this.connections.toJson();
    data['images'] = this.images.toJson();
    return data;
  }
}

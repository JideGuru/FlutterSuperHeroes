class HeroItem {
  int id;
  String name;
  String slug;
  Powerstats powerstats;
  Appearance appearance;
  Biography biography;
  Work work;
  Connections connections;
  Images images;

  HeroItem(
      {this.id,
        this.name,
        this.slug,
        this.powerstats,
        this.appearance,
        this.biography,
        this.work,
        this.connections,
        this.images});

  HeroItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    powerstats = json['powerstats'] != null
        ? new Powerstats.fromJson(json['powerstats'])
        : null;
    appearance = json['appearance'] != null
        ? new Appearance.fromJson(json['appearance'])
        : null;
    biography = json['biography'] != null
        ? new Biography.fromJson(json['biography'])
        : null;
    work = json['work'] != null ? new Work.fromJson(json['work']) : null;
    connections = json['connections'] != null
        ? new Connections.fromJson(json['connections'])
        : null;
    images =
    json['images'] != null ? new Images.fromJson(json['images']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['slug'] = this.slug;
    if (this.powerstats != null) {
      data['powerstats'] = this.powerstats.toJson();
    }
    if (this.appearance != null) {
      data['appearance'] = this.appearance.toJson();
    }
    if (this.biography != null) {
      data['biography'] = this.biography.toJson();
    }
    if (this.work != null) {
      data['work'] = this.work.toJson();
    }
    if (this.connections != null) {
      data['connections'] = this.connections.toJson();
    }
    if (this.images != null) {
      data['images'] = this.images.toJson();
    }
    return data;
  }
}

class Powerstats {
  int intelligence;
  int strength;
  int speed;
  int durability;
  int power;
  int combat;

  Powerstats(
      {this.intelligence,
        this.strength,
        this.speed,
        this.durability,
        this.power,
        this.combat});

  Powerstats.fromJson(Map<String, dynamic> json) {
    intelligence = json['intelligence'];
    strength = json['strength'];
    speed = json['speed'];
    durability = json['durability'];
    power = json['power'];
    combat = json['combat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['intelligence'] = this.intelligence;
    data['strength'] = this.strength;
    data['speed'] = this.speed;
    data['durability'] = this.durability;
    data['power'] = this.power;
    data['combat'] = this.combat;
    return data;
  }
}

class Appearance {
  String gender;
  String race;
  List<String> height;
  List<String> weight;
  String eyeColor;
  String hairColor;

  Appearance(
      {this.gender,
        this.race,
        this.height,
        this.weight,
        this.eyeColor,
        this.hairColor});

  Appearance.fromJson(Map<String, dynamic> json) {
    gender = json['gender'];
    race = json['race'];
    height = json['height'].cast<String>();
    weight = json['weight'].cast<String>();
    eyeColor = json['eyeColor'];
    hairColor = json['hairColor'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['gender'] = this.gender;
    data['race'] = this.race;
    data['height'] = this.height;
    data['weight'] = this.weight;
    data['eyeColor'] = this.eyeColor;
    data['hairColor'] = this.hairColor;
    return data;
  }
}

class Biography {
  String fullName;
  String alterEgos;
  List<String> aliases;
  String placeOfBirth;
  String firstAppearance;
  String publisher;
  String alignment;

  Biography(
      {this.fullName,
        this.alterEgos,
        this.aliases,
        this.placeOfBirth,
        this.firstAppearance,
        this.publisher,
        this.alignment});

  Biography.fromJson(Map<String, dynamic> json) {
    fullName = json['fullName'];
    alterEgos = json['alterEgos'];
    aliases = json['aliases'].cast<String>();
    placeOfBirth = json['placeOfBirth'];
    firstAppearance = json['firstAppearance'];
    publisher = json['publisher'];
    alignment = json['alignment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fullName'] = this.fullName;
    data['alterEgos'] = this.alterEgos;
    data['aliases'] = this.aliases;
    data['placeOfBirth'] = this.placeOfBirth;
    data['firstAppearance'] = this.firstAppearance;
    data['publisher'] = this.publisher;
    data['alignment'] = this.alignment;
    return data;
  }
}

class Work {
  String occupation;
  String base;

  Work({this.occupation, this.base});

  Work.fromJson(Map<String, dynamic> json) {
    occupation = json['occupation'];
    base = json['base'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['occupation'] = this.occupation;
    data['base'] = this.base;
    return data;
  }
}

class Connections {
  String groupAffiliation;
  String relatives;

  Connections({this.groupAffiliation, this.relatives});

  Connections.fromJson(Map<String, dynamic> json) {
    groupAffiliation = json['groupAffiliation'];
    relatives = json['relatives'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['groupAffiliation'] = this.groupAffiliation;
    data['relatives'] = this.relatives;
    return data;
  }
}

class Images {
  String xs;
  String sm;
  String md;
  String lg;

  Images({this.xs, this.sm, this.md, this.lg});

  Images.fromJson(Map<String, dynamic> json) {
    xs = json['xs'];
    sm = json['sm'];
    md = json['md'];
    lg = json['lg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['xs'] = this.xs;
    data['sm'] = this.sm;
    data['md'] = this.md;
    data['lg'] = this.lg;
    return data;
  }
}

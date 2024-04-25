class Appearance {
  Appearance({
    required this.gender,
    required this.race,
    required this.height,
    required this.weight,
    required this.eyeColor,
    required this.hairColor,
  });

  final String gender;
  final String race;
  final List<String> height;
  final List<String> weight;
  final String eyeColor;
  final String hairColor;

  factory Appearance.fromJson(Map<String, dynamic> json) {
    final gender = json['gender'];
    final race = json['race'] ?? "None";
    final height = json['height'].cast<String>();
    final weight = json['weight'].cast<String>();
    final eyeColor = json['eyeColor'];
    final hairColor = json['hairColor'];

    return Appearance(
        gender: gender,
        race: race,
        height: height,
        weight: weight,
        eyeColor: eyeColor,
        hairColor: hairColor);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['gender'] = gender;
    data['race'] = race;
    data['height'] = height;
    data['weight'] = weight;
    data['eyeColor'] = eyeColor;
    data['hairColor'] = hairColor;
    return data;
  }
}

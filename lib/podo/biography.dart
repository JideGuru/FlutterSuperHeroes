class Biography {
  Biography({
    required this.fullName,
    required this.alterEgos,
    required this.aliases,
    required this.placeOfBirth,
    required this.firstAppearance,
    required this.publisher,
    required this.alignment,
  });

  final String fullName;
  final String alterEgos;
  final List<String> aliases;
  final String placeOfBirth;
  final String firstAppearance;
  final String publisher;
  final String alignment;

  factory Biography.fromJson(Map<String, dynamic> json) {
    final fullName = json['fullName'];
    final alterEgos = json['alterEgos'];
    final aliases = json['aliases'].cast<String>();
    final placeOfBirth = json['placeOfBirth'];
    final firstAppearance = json['firstAppearance'];
    final publisher = json['publisher'];
    final alignment = json['alignment'];

    return Biography(
      fullName: fullName,
      alterEgos: alterEgos,
      aliases: aliases,
      placeOfBirth: placeOfBirth,
      firstAppearance: firstAppearance,
      publisher: publisher,
      alignment: alignment,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['fullName'] = fullName;
    data['alterEgos'] = alterEgos;
    data['aliases'] = aliases;
    data['placeOfBirth'] = placeOfBirth;
    data['firstAppearance'] = firstAppearance;
    data['publisher'] = publisher;
    data['alignment'] = alignment;
    return data;
  }
}

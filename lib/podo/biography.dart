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

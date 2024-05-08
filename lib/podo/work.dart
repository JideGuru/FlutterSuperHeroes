class Work {
  Work({required this.occupation, required this.base});

  final String occupation;
  final String base;

  factory Work.fromJson(Map<String, dynamic> json) {
    final occupation = json['occupation'];
    final base = json['base'];

    return Work(occupation: occupation, base: base);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['occupation'] = occupation;
    data['base'] = base;
    return data;
  }
}

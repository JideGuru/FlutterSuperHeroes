class Connections {
  Connections({required this.groupAffiliation, required this.relatives});

  final String groupAffiliation;
  final String relatives;

  factory Connections.fromJson(Map<String, dynamic> json) {
    final groupAffiliation = json['groupAffiliation'];
    final relatives = json['relatives'];

    return Connections(
      groupAffiliation: groupAffiliation,
      relatives: relatives,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['groupAffiliation'] = groupAffiliation;
    data['relatives'] = relatives;
    return data;
  }
}

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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['groupAffiliation'] = this.groupAffiliation;
    data['relatives'] = this.relatives;
    return data;
  }
}

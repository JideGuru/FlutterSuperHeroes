class Powerstats {
  Powerstats({
    required this.intelligence,
    required this.strength,
    required this.speed,
    required this.durability,
    required this.power,
    required this.combat,
  });

  final int intelligence;
  final int strength;
  final int speed;
  final int durability;
  final int power;
  final int combat;

  factory Powerstats.fromJson(Map<String, dynamic> json) {
    final intelligence = json['intelligence'] ?? 0;
    final strength = json['strength'] ?? 0;
    final speed = json['speed'] ?? 0;
    final durability = json['durability'] ?? 0;
    final power = json['power'] ?? 0;
    final combat = json['combat'] ?? 0;

    return Powerstats(
      intelligence: intelligence,
      strength: strength,
      speed: speed,
      durability: durability,
      power: power,
      combat: combat,
    );
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

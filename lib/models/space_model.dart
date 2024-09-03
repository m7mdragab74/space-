class SpaceModel {
  String? id;
  String? name;
  String? image;
  String? homePorts;

  SpaceModel({
    required this.id,
    required this.name,
    required this.image,
    required this.homePorts,
  });

  factory SpaceModel.fromJson(Map<String, dynamic> json) {
    return SpaceModel(
      id: json['legacy_id'],
      name: json['name'],
      image: json['image'],
      homePorts: json['home_port'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'homePorts': homePorts,
    };
  }

  factory SpaceModel.fromMap(Map<String, dynamic> map) {
    return SpaceModel(
      id: map['id'],
      name: map['name'],
      image: map['image'],
      homePorts: map['homePorts'],
    );
  }
}

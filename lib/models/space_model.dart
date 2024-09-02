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
}

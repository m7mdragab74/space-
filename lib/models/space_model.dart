class SpaceModel {
  String? id;
  String? name;
  String? image;

  SpaceModel({required this.id, required this.name, required this.image});

  factory SpaceModel.fromJson(Map<String, dynamic> json) {
    return SpaceModel(
        id: json['legacy_id'], name: json['name'], image: json['image']);
  }
}

class Attraction {
  final String name;
  final String imageAsset;
  final String description;

  Attraction(
      {required this.name,
      required this.imageAsset,
      required this.description});

  factory Attraction.fromJSON(Map<String, dynamic> json) {
    return Attraction(
      name: json['name'],
      imageAsset: json['imageAsset'],
      description: json['description'],
    );
  }
}

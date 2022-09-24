import 'package:travel_app/models/attraction.dart';

class Destination {
  final String name;
  final String imageAsset;
  final String description;
  final List<Attraction> attractions;

  const Destination({
    required this.name,
    this.imageAsset = "assets/beach_square.png",
    required this.description,
    required this.attractions,
  });

  factory Destination.fromJSON(Map<String, dynamic> json) {
    List<Attraction> attractions = [];

    if (json['attractions'] != null) {
      json['attractions'].forEach((v) {
        attractions.add(Attraction.fromJSON(v));
      });
    }
    return Destination(
      name: json['name'],
      imageAsset: json['imageAsset'],
      description: json['description'],
      attractions: attractions,
    );
  }
}

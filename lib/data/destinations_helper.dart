import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:travel_app/models/destination.dart';

class DestinationsHelper {
  static Future<List<Destination>> getDestinations() async {
    // bug: this finished after the age loads, so we don't get the destinations when the ui loads.
    // I think the solution might be to use a future builder or something. Better ask in the slack group
    String destinationsJSON = await rootBundle.loadString('assets/data.json');
    List<dynamic> destinationsJSONDecoded = jsonDecode(destinationsJSON);
    return destinationsJSONDecoded.map((e) => Destination.fromJSON(e)).toList();
  }
}

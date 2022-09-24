import 'package:flutter/material.dart';
import 'package:travel_app/ui/widgets.dart';

class DestinationDetail extends StatelessWidget {
  const DestinationDetail({super.key, required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    return TravelAppScaffold(
      body: Text("DestinationDetail: $name"),
    );
  }
}

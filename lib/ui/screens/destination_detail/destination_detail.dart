import 'package:flutter/material.dart';
import 'package:travel_app/models/destination.dart';
import 'package:travel_app/ui/screens/destination_detail/attractions_list.dart';
import 'package:travel_app/ui/widgets/banner_image.dart';
import 'package:travel_app/ui/widgets/travel_app_scaffold.dart';
import 'package:travel_app/ui/widgets/widgets.dart';
import 'package:travel_app/utils/constants.dart';

class DestinationDetail extends StatelessWidget {
  const DestinationDetail({super.key, required this.destination});

  final Destination destination;

  @override
  Widget build(BuildContext context) {
    return TravelAppScaffold(
      appBarTitle: destination.name,
      body: Column(
        children: [
          BannerImage(assetPath: destination.imageAsset),
          const SectionTitle("Popular Attractions"),
          Expanded(
            child: AttractionsList(
              attractions: destination.attractions,
            ),
          ),
          const SectionTitle(
            "Information",
            titleSize: SectionTitleSizes.titleMedium,
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Text(destination.description),
            ),
          ),
        ],
      ),
    );
  }
}

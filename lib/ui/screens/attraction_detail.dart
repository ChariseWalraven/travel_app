import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:travel_app/models/attraction.dart';
import 'package:travel_app/ui/widgets/banner_image.dart';
import 'package:travel_app/ui/widgets/travel_app_scaffold.dart';
import 'package:travel_app/ui/widgets/widgets.dart';

class AttractionDetail extends StatelessWidget {
  const AttractionDetail(this.attraction, {super.key});

  final Attraction attraction;

  @override
  Widget build(BuildContext context) {
    return TravelAppScaffold(
      appBarTitle: attraction.name,
      body: Column(
        children: [
          BannerImage(
            assetPath: attraction.imageAsset,
          ),
          SectionTitle(attraction.name),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(attraction.description),
            ),
          )
        ],
      ),
    );
  }
}

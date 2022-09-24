import 'package:flutter/material.dart';
import 'package:travel_app/models/attraction.dart';
import 'package:travel_app/models/destination.dart';
import 'package:travel_app/ui/widgets/banner_image.dart';
import 'package:travel_app/ui/widgets/travel_app_scaffold.dart';
import 'package:travel_app/ui/widgets/widgets.dart';

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
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: destination.attractions.length,
              itemBuilder: (context, index) {
                final Attraction attraction = destination.attractions[index];
                const double attractionImageSize = 80.0;
                return SizedBox(
                  width: attractionImageSize + 20.0,
                  height: attractionImageSize + 20.0,
                  child: Column(
                    children: [
                      Container(
                        height: attractionImageSize,
                        width: attractionImageSize,
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(attractionImageSize / 2),
                          image: DecorationImage(
                            alignment: Alignment.center,
                            fit: BoxFit.cover,
                            image: AssetImage(attraction.imageAsset),
                          ),
                        ),
                      ),
                      Text(
                        attraction.name,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

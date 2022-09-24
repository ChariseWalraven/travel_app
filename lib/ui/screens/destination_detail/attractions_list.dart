import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:travel_app/models/attraction.dart';
import 'package:travel_app/ui/screens/attraction_detail.dart';

class AttractionsList extends StatelessWidget {
  const AttractionsList({super.key, required this.attractions});

  final List<Attraction> attractions;

  @override
  Widget build(BuildContext context) {
    const double attractionImageSize = 80.0;
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: attractions.length,
        itemBuilder: (context, index) {
          final Attraction attraction = attractions[index];
          return AttractionTile(
            attractionImageSize: attractionImageSize,
            attraction: attraction,
          );
        },
      ),
    );
  }
}

class AttractionTile extends StatelessWidget {
  const AttractionTile({
    super.key,
    required this.attractionImageSize,
    required this.attraction,
  });

  final double attractionImageSize;
  final Attraction attraction;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: GestureDetector(
        onTap: () => Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return AttractionDetail(attraction);
          },
        )),
        child: SizedBox(
          width: attractionImageSize + 20.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: attractionImageSize,
                width: attractionImageSize,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(attractionImageSize / 2),
                  image: DecorationImage(
                    alignment: Alignment.center,
                    fit: BoxFit.cover,
                    image: AssetImage(attraction.imageAsset),
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  textAlign: TextAlign.center,
                  attraction.name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

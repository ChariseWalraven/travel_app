import 'package:flutter/material.dart';
import 'package:travel_app/data/destinations_helper.dart';
import 'package:travel_app/models/destination.dart' as models;
import 'package:travel_app/ui/screens/test.dart';
import 'package:travel_app/utils/constants.dart';

class BannerImage extends StatelessWidget {
  /// Displays a banner image
  const BannerImage({Key? key, required this.assetPath}) : super(key: key);

  final String assetPath;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(15),
          bottomRight: Radius.circular(15),
        ),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 15),
      child: Image(
        image: AssetImage(assetPath),
      ),
    );
  }
}

class DestinationTile extends StatelessWidget {
  /// Displays a destination tile
  const DestinationTile(this.destination, {super.key});

  final models.Destination destination;

  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2),
          boxShadow: kElevationToShadow[1],
          color: isDarkMode ? Colors.grey.shade100 : Colors.grey.shade800,
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 5, left: 5, right: 5),
          child: Column(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      alignment: Alignment.bottomCenter,
                      image: AssetImage(destination.imageAsset),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  destination.name,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DestinationGrid extends StatefulWidget {
  /// Displays a grid of destination tiles
  const DestinationGrid({super.key});

  @override
  State<DestinationGrid> createState() => _DestinationGridState();
}

class _DestinationGridState extends State<DestinationGrid> {
  final Future<List<models.Destination>> destinations =
      DestinationsHelper.getDestinations();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<models.Destination>>(
        future: destinations,
        builder: (BuildContext context,
            AsyncSnapshot<List<models.Destination>> snapshot) {
          Widget child = Column(
            children: const [
              SizedBox(
                width: 60,
                height: 60,
                child: CircularProgressIndicator(),
              ),
              Padding(
                padding: EdgeInsets.only(top: 16),
                child: Text('Awaiting result...'),
              ),
            ],
          );
          ;

          if (snapshot.hasData) {
            List<models.Destination>? destinations = snapshot.data;
            child = GridView.builder(
      shrinkWrap: true,
              itemCount: destinations?.length,
      padding: const EdgeInsets.all(5),
      physics: const ScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
      itemBuilder: ((context, int index) {
                return DestinationTile(destinations![index]);
      }),
    );
          } else if (snapshot.hasError) {
            <Widget>[
              const Icon(
                Icons.error_outline,
                color: Colors.red,
                size: 60,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text('Error: ${snapshot.error}'),
              ),
            ];
          }
          return child;
        });
  }
}

class SectionTitle extends StatelessWidget {
  /// Displays a section title
  const SectionTitle(
    this.title, {
    Key? key,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headlineSmall,
      ),
    );
  }
}

class Tag extends StatelessWidget {
  /// Displays a tag
  const Tag(
    this.tagName, {
    Key? key,
  }) : super(key: key);

  final String tagName;

  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    return Container(
      decoration: BoxDecoration(
        color: isDarkMode ? Colors.deepPurple.shade800 : Colors.pink.shade100,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Text(
          tagName,
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ),
    );
  }
}

class TagRow extends StatelessWidget {
  /// Displays a row of tags
  const TagRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Tag("Attractions"),
          Tag("Places"),
          Tag("Hotels"),
          Tag("Shows"),
        ],
      ),
    );
  }
}

class TravelAppScaffold extends StatelessWidget {
  const TravelAppScaffold({
    super.key,
    this.body,
    this.appBar,
  });

  final Widget? body;
  final PreferredSizeWidget? appBar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar ??
          AppBar(
            title: GestureDetector(
              onDoubleTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const TestScreen(),
                ),
              ),
              child: Text(
                appName,
                style: Theme.of(context)
                    .appBarTheme
                    .titleTextStyle
                    ?.copyWith(letterSpacing: 2.5),
              ),
            ),
          ),
      body: SafeArea(
        child: body ?? Container(),
      ),
    );
  }
}

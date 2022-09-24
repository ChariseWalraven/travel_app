import 'package:flutter/material.dart';
import 'package:travel_app/data/destinations_helper.dart';
import 'package:travel_app/models/destination.dart' as models;
import 'package:travel_app/ui/screens/destination_detail/destination_detail.dart';

class DestinationTile extends StatelessWidget {
  /// Displays a destination tile
  const DestinationTile(this.destination, {super.key});

  final models.Destination destination;

  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DestinationDetail(
            destination: destination,
          ),
        ),
      ),
      child: Padding(
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

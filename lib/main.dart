import 'package:flutter/material.dart';
import 'package:travel_app/data/destinations.dart';
import 'package:travel_app/ui/screens/test.dart';
import 'package:travel_app/ui/theme.dart';
import 'package:travel_app/ui/widgets.dart';
import 'package:travel_app/utils/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        Routes.home: (context) => const TravelApp(),
        Routes.test: (context) => const TestScreen(),
      },
      title: 'Travel App',
      theme: travelAppLightTheme,
      darkTheme: travelAppDarkTheme,
    );
  }
}

class TravelApp extends StatelessWidget {
  const TravelApp({super.key});

  @override
  Widget build(BuildContext context) {
    return TravelAppScaffold(
      body: ListView(
        shrinkWrap: true,
        children: [
          const BannerImage(assetPath: "assets/banner.jpg"),
          const SectionTitle("Popular Destinations"),
          const TagRow(),
          DestinationGrid(destinations),
        ],
      ),
    );
  }
}

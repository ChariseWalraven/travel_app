import 'package:flutter/material.dart';
import 'package:travel_app/data/destinations.dart';
import 'package:travel_app/ui/theme.dart';
import 'package:travel_app/ui/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travel App',
      home: const TravelApp(),
      theme: travelAppLightTheme,
      darkTheme: travelAppDarkTheme,
    );
  }
}

class TravelApp extends StatelessWidget {
  const TravelApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "TRAVEL APP",
            style: Theme.of(context)
                .appBarTheme
                .titleTextStyle
                ?.copyWith(letterSpacing: 2.5),
          ),
        ),
        body: ListView(
          shrinkWrap: true,
          children: [
            const BannerImage(assetPath: "assets/banner.jpg"),
            const SectionTitle("Popular Destinations"),
            const TagRow(),
            DestinationGrid(destinations),
          ],
        ),
      ),
    );
  }
}

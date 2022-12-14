import 'package:flutter/material.dart';
import 'package:travel_app/ui/theme.dart';
import 'package:travel_app/ui/widgets/banner_image.dart';
import 'package:travel_app/ui/widgets/destination.dart';
import 'package:travel_app/ui/widgets/travel_app_scaffold.dart';
import 'package:travel_app/ui/widgets/widgets.dart';

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
      theme: travelAppLightTheme,
      darkTheme: travelAppDarkTheme,
      home: const TravelApp(),
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
        children: const [
          BannerImage(assetPath: "assets/banner.jpg"),
          SectionTitle("Popular Destinations"),
          TagRow(),
          DestinationGrid(),
        ],
      ),
    );
  }
}

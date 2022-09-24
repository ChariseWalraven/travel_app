
import 'package:flutter/material.dart';
import 'package:travel_app/ui/screens/test.dart';
import 'package:travel_app/utils/constants.dart';

class TravelAppScaffold extends StatelessWidget {
  const TravelAppScaffold({
    super.key,
    this.body,
    this.appBar,
    this.appBarTitle = appName,
  });

  final Widget? body;
  final PreferredSizeWidget? appBar;
  final String appBarTitle;

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
                appBarTitle.toUpperCase(),
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

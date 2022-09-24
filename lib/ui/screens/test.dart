import 'package:flutter/material.dart';
import 'package:travel_app/ui/widgets/travel_app_scaffold.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return TravelAppScaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            TestAnimatedContainer(),
          ],
        ),
      ),
    );
  }
}

class TestAnimatedContainer extends StatefulWidget {
  const TestAnimatedContainer({super.key});

  @override
  State<TestAnimatedContainer> createState() => _TestAnimatedContainerState();
}

class _TestAnimatedContainerState extends State<TestAnimatedContainer> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selected = !selected;
        });
      },
      child: AnimatedContainer(
        width: selected ? 200.0 : 100.0,
        height: selected ? 100.0 : 200.0,
        alignment: selected ? Alignment.center : AlignmentDirectional.topCenter,
        duration: const Duration(seconds: 2),
        curve: Curves.linear,
        decoration: BoxDecoration(
          color: selected ? Colors.red : Colors.blue,
          boxShadow: selected
              ? [
                  const BoxShadow(
                    blurRadius: 0,
                    offset: Offset(-20, -20),
                  )
                ]
              : [
                  const BoxShadow(
                    blurRadius: 0,
                    offset: Offset(20, 20),
                  ),
                ],
        ),
        child: const FlutterLogo(size: 75),
      ),
    );
  }
}

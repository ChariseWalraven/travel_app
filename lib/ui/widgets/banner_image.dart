import 'package:flutter/widgets.dart';

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

import 'package:flutter/material.dart';
import 'package:travel_app/utils/constants.dart';

class SectionTitle extends StatelessWidget {
  /// Displays a section title
  const SectionTitle(
    this.title, {
    this.titleSize = SectionTitleSizes.titleLarge,
    Key? key,
  }) : super(key: key);

  final String title;
  final SectionTitleSizes titleSize;

  @override
  Widget build(BuildContext context) {
    TextStyle? style;
    if (titleSize == SectionTitleSizes.titleSmall) {
      style = Theme.of(context).textTheme.titleSmall;
    }
    if (titleSize == SectionTitleSizes.titleMedium) {
      style = Theme.of(context).textTheme.titleMedium;
    }
    if (titleSize == SectionTitleSizes.titleLarge) {
      style = Theme.of(context).textTheme.titleLarge;
    }
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Text(
        title,
        style: style,
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

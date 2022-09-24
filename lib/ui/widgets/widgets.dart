import 'package:flutter/material.dart';

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

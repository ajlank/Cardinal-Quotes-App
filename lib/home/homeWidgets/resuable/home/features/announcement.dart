import 'package:flutter/material.dart';

class Announcement extends StatelessWidget {
  const Announcement({super.key, required this.isTrue});
  final bool isTrue;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Image.asset(isTrue?'assets/turn_on_featured_quotes/Rectangle27.png':'assets/body_grid_items/announcement.png'),
          ),
        )
      ],
    );
  }
}
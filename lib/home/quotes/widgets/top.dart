import 'package:flutter/material.dart';

class TopHd extends StatelessWidget {
  const TopHd({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: Image.asset('assets/sleep_sounds/right_arrow.png'),
        ),
        const SizedBox(width: 7),
        const Text(
          'Top Quotes',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}
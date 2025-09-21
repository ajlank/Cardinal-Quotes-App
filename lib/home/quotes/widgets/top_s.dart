import 'package:flutter/material.dart';

class TopS extends StatelessWidget {
  const TopS({super.key});

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
          'Soul Check-In',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}
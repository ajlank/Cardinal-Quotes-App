import 'package:flutter/material.dart';

class TimerPannel extends StatelessWidget {
  const TimerPannel({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          '04:00',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
        const Text(
          '12:00',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}

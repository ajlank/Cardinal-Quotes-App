import 'package:flutter/material.dart';

class Bar extends StatelessWidget {
  const Bar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 10,
      child: LinearProgressIndicator(
        value: 0.6,
        valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF4A3A2A)),
        backgroundColor: Colors.grey[300],
        borderRadius: BorderRadius.circular(6),
      ),
    );
  }
}

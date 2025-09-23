import 'package:flutter/material.dart';

class IconWithText extends StatelessWidget {
  const IconWithText({super.key, required this.asset, required this.text});
  final String asset;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(asset, width: 20, height: 20),
        const SizedBox(width: 3),
        Text(text, style: const TextStyle(color: Colors.white)),
      ],
    );
  }
  }
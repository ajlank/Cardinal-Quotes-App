import 'package:flutter/material.dart';

class ActionItem extends StatelessWidget {
  const ActionItem({super.key, required this.iconPath, required this.label});
 final String iconPath;
 final String label;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Padding(
        padding: const EdgeInsets.only(right: 12),
        child: Row(
          children: [
            Image.asset(iconPath, width: 20, height: 20),
            const SizedBox(width: 3),
            Text(label, style: const TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
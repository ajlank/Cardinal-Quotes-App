import 'package:flutter/material.dart';

class ReusableHeader extends StatelessWidget {
  const ReusableHeader({super.key,required this.leftText,required this.rightText});
 
  final String leftText;
  final String rightText;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            leftText,
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),

          Text(
            rightText,
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
        ],
      ),
    );
  }
}

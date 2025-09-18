import 'package:flutter/material.dart';

class ReusableHeader extends StatelessWidget {
  const ReusableHeader({super.key,required this.leftText,required this.rightText});
 
  final String leftText;
  final String rightText;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 29),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            leftText,
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),

          Row(
            children: [
              Text(
                rightText,
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
              SizedBox(
                width: 7,
              ),
              Image.asset('assets/body_grid_items/arrow_right.png')
            ],
          ),
        ],
      ),
    );
  }
}

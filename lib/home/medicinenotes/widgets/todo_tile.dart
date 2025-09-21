import 'package:flutter/material.dart';

class TodoTile extends StatelessWidget {
  const TodoTile({super.key, required this.wid, required this.leftImg,
    required this.title, required this.leadingText,
    required this.shouldRed});
  final double wid;
  final String leftImg;
  final String title;
  final String leadingText;
  final bool shouldRed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: Container(
        width: wid * .90,
        height: 40,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 246, 236, 197),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(
                 leftImg,
                  width: 50,
                  height: 50,
                ),

                Text(
                  title,
                  style: TextStyle(
                    color:Color(0xFF4A3A2A),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(right: 22, bottom: 4),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                   leadingText,
                    style: TextStyle(
                      color: (shouldRed)?Colors.red:Color(0xFF4A3A2A),
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

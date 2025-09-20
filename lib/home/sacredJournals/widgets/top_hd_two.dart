import 'package:flutter/material.dart';

class TopHdTwo extends StatelessWidget {
  const TopHdTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
      Row(
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
      ),

      Row(
        children: [
          SizedBox(
            height: 40,
            width: 40,
            child: Image.asset('assets/top_quotes/search_ic.png'),
          )
        ],
      )
      ],
    );
  }
}
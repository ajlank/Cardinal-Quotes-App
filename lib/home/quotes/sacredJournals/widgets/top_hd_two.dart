import 'package:cardinal_quotes_app/utils/appRoutes/constants/constant.dart';
import 'package:flutter/material.dart';

class TopHdTwo extends StatelessWidget {
  const TopHdTwo({super.key, required this.topHd});
  final String topHd;
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
         Text(
          topHd,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400),
        ),
        ],
      ),

      Row(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(searchViewRoute);
            },
            child: SizedBox(
              height: 40,
              width: 40,
              child: Image.asset('assets/top_quotes/search_ic.png'),
            ),
          )
        ],
      )
      ],
    );
  }
}
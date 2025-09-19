import 'package:flutter/material.dart';

class FeatureMemorialCards extends StatelessWidget {
     final List<String> memorial=[
      'assets/feature_memorial_cards/3.png',
      'assets/feature_memorial_cards/1.png',
      'assets/feature_memorial_cards/2.png',
   ];


   FeatureMemorialCards({super.key});

  @override
  Widget build(BuildContext context) {
    
    return SizedBox(
      height: 130, 
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
        itemCount: memorial.length,
        itemBuilder: (context, i) {
          return Container(
            margin: const EdgeInsets.only(right: 16),
            height: 100,
            width: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
               image: DecorationImage(
                image: AssetImage(memorial[i]),
                fit: BoxFit.fill,
              ),
            ),
           
          );
        },
      ),
    );
  }
}
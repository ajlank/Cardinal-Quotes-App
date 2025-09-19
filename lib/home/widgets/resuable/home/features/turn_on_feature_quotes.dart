import 'package:flutter/material.dart';

class TurnOnFeatureQuotes extends StatelessWidget {
     final List<String> quotes=[
      'assets/turn_on_featured_quotes/image.png',
       'assets/turn_on_featured_quotes/image-1.png',
      'assets/turn_on_featured_quotes/image-2.png',
   ];


   TurnOnFeatureQuotes({super.key});

  @override
  Widget build(BuildContext context) {
    
    return SizedBox(
      height: 130, 
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
        itemCount: quotes.length,
        itemBuilder: (context, i) {
          return Container(
            margin: const EdgeInsets.only(right: 16),
            height: 100,
            width: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
               image: DecorationImage(
                image: AssetImage(quotes[i]),
                fit: BoxFit.fill,
              ),
            ),
           
          );
        },
      ),
    );
  }
}
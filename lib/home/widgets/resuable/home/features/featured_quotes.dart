import 'package:flutter/material.dart';

class FeaturedQuotes extends StatelessWidget {
     final List<String> quotes=[
      'assets/cardinal_quotes_img/3.png',
       'assets/cardinal_quotes_img/2.png',
      'assets/cardinal_quotes_img/1.png',
   ];


   FeaturedQuotes({super.key});

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
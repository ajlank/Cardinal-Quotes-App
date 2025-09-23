import 'package:cardinal_quotes_app/home/featureds/featured_cards/hooks/fetch/fetch_featureds_cards.dart';
import 'package:cardinal_quotes_app/home/featureds/featured_cards/model/featureds_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class FeatureMemorialCards extends HookWidget {
     final List<String> memorial=[
      'assets/feature_memorial_cards/3.png',
      'assets/feature_memorial_cards/1.png',
      'assets/feature_memorial_cards/2.png',
   ];


   FeatureMemorialCards({super.key});

  @override
  Widget build(BuildContext context) {
       final result = fetchFeaturedCards();

    if (result.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (result.error != null) {
      return Center(child: Text("Error: ${result.error}"));
    }

    if (result.featuredCards.isEmpty ||
        result.featuredCards.first.data.visualList.isEmpty) {
      return const Center(child: Text("No wallpapers found"));
    }

    final cardItems = result.featuredCards.first.data.visualList
        .where((item) => item.category == VisualCategory.MEMORIAL_CARD)
        .toList();
    return SizedBox(
      height: 130, 
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
        itemCount: cardItems.length,
        itemBuilder: (context, i) {
          var cardItem=cardItems[i];
          return Container(
            margin: const EdgeInsets.only(right: 16),
            height: 100,
            width: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
               image: DecorationImage(
                image: NetworkImage(cardItem.imagePath),
                fit: BoxFit.fill,
              ),
            ),
           
          );
        },
      ),
    );
  }
}
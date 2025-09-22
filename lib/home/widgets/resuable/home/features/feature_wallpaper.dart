import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:cardinal_quotes_app/home/featured_cards/hooks/fetch/fetch_featureds_cards.dart';
import 'package:cardinal_quotes_app/home/featured_cards/model/featureds_model.dart'; // Replace with your actual model import
import 'package:provider/provider.dart';

class FeatureWallpaper extends HookWidget {
  const FeatureWallpaper({super.key});

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
        .where((item) => item.category == VisualCategory.WALLPAPER)
        .toList();

    return SizedBox(
      height: 130,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: cardItems.length,
        itemBuilder: (context, i) {
          final item = cardItems[i];
          return Container(
            margin: const EdgeInsets.only(right: 16),
            height: 100,
            width: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                image: NetworkImage(item.imagePath),
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}

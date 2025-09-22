import 'package:cardinal_quotes_app/home/featured_cards/model/featureds_model.dart';

class FetchFeaturedCardsResult {
    
    final List<FeaturedsModel> featuredCards;
    final bool isLoading;
    final String? error;

  FetchFeaturedCardsResult({required this.featuredCards, required this.isLoading, required this.error});

  

 
  
}
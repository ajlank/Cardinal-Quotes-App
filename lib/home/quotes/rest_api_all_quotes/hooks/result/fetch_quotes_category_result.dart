
import 'package:cardinal_quotes_app/home/quotes/rest_api_all_quotes/model/quotes_model.dart';
import 'package:flutter/animation.dart';
class FetchQuotesCategoryResult {
    
    final List<AllQuotesModel> quotes;
    final bool isLoading;
    final String? error;
    final VoidCallback refetch;
  FetchQuotesCategoryResult({required this.quotes, required this.isLoading,
   required this.error,required this.refetch});

 
  
}
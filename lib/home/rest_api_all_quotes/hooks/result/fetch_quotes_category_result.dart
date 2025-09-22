
import 'package:cardinal_quotes_app/home/rest_api_all_quotes/model/quotes_model.dart';
class FetchQuotesCategoryResult {
    
    final List<AllQuotesModel> quotes;
    final bool isLoading;
    final String? error;

  FetchQuotesCategoryResult({required this.quotes, required this.isLoading, required this.error});

 
  
}
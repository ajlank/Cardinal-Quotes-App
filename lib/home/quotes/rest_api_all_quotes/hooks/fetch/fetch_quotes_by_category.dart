import 'dart:convert';
import 'package:cardinal_quotes_app/home/quotes/rest_api_all_quotes/hooks/result/fetch_quotes_category_result.dart';
import 'package:cardinal_quotes_app/home/quotes/rest_api_all_quotes/model/quotes_model.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:http/http.dart' as http;

FetchQuotesCategoryResult fetchQuotesByCategory(String category){
  final allQuotes = useState<List<AllQuotesModel>>([]);
  final isLoading = useState(false);
  final error = useState<String?>(null);
  
  Future<void> fetchData() async {
    isLoading.value = true;
    try {
      final url = Uri.parse("https://cardinaldailyquotes.com/api/quotes/$category");
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final decoded = jsonDecode(response.body);
        if (decoded["status"] == "success") {
          
          allQuotes.value = [AllQuotesModel.fromJson(decoded)];
        } else {
          error.value = decoded["status"] ?? "Error";
        }
      } else {
        error.value = "HTTP error: ${response.statusCode}";
      }
    } catch (e) {
      error.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }
  void refetch(){
    fetchData();
    isLoading.value=false;

  }
  useEffect(() {
    fetchData();
    return null;
  }, const []);

   return FetchQuotesCategoryResult(quotes: allQuotes.value, 
   isLoading: isLoading.value, error: error.value, refetch: refetch);
}

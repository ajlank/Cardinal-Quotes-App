import 'dart:convert';
import 'package:cardinal_quotes_app/home/featured_cards/hooks/result/fetch_featured_cards_result.dart';
import 'package:cardinal_quotes_app/home/featured_cards/model/featureds_model.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:http/http.dart' as http;

FetchFeaturedCardsResult fetchFeaturedCards(){
  final featuredCards= useState<List<FeaturedsModel>>([]);
  final isLoading = useState(false);
  final error = useState<String?>(null);

  Future<void> fetchData() async {
    isLoading.value = true;
    try {
      final url = Uri.parse("https://cardinaldailyquotes.com/api/featureds");
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final decoded = jsonDecode(response.body);
        if (decoded["status"] == "success") {
          
          featuredCards.value = [FeaturedsModel.fromJson(decoded)];
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

  useEffect(() {
    fetchData();
    return null;
  }, const []);

  return FetchFeaturedCardsResult(featuredCards: featuredCards.value, 
  isLoading: isLoading.value, error: error.value);
}
import 'dart:convert';
import 'package:cardinal_quotes_app/home/quotes/sacredJournals/hooks/result/get_posts_result.dart';
import 'package:cardinal_quotes_app/home/quotes/save_backends/model/save_post_response.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:http/http.dart' as http;

GetPostsResult userSearchedPost(String k) {
  final audios = useState<List<Audio>>([]);
  final quotes = useState<List<Quote>>([]);
  final visuals = useState<List<Visual>>([]);
  final isLoading = useState<bool>(true);
  final error = useState<String?>(null);

  Future<void> fetchSavedPosts() async {
    isLoading.value = true;
    try {
      final url = Uri.parse(
        "https://cardinaldailyquotes.com/api/users/keywords/$k"
      );

      final response = await http.get(url); 

      print(response.body);
      print(response.statusCode);

      if (response.statusCode == 200) {
        final decoded = jsonDecode(response.body);

        if (decoded["status"] == "success") {
          final data = SavedData.fromJson(decoded["data"]);
          // audios.value = data.audios;
          // quotes.value = data.quotes;
          // visuals.value = data.visuals;
        } else {
          // error.value = decoded["status"] ?? "Unknown error";
        }
      } else {
        // error.value = "HTTP error: ${response.statusCode}";
      }
    } catch (e) {
      // error.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  useEffect(() {
    fetchSavedPosts();
    return null;
  }, const []);

  return GetPostsResult(
    audios: audios.value,
    quotes: quotes.value,
    visuals: visuals.value,
    isLoading: isLoading.value,
    error: error.value,
  );
}

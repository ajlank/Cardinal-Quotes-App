import 'dart:convert';

import 'package:cardinal_quotes_app/home/rest_api_all_sounds/hooks/result/fetch_sounds_category_result.dart';
import 'package:cardinal_quotes_app/home/rest_api_all_sounds/model/sounds_model.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:http/http.dart' as http;

FetchSoundsCategoryResult fetchSoundsByCategory(String category){
  final sounds = useState<List<SoundsModel>>([]);
  final isLoading = useState(false);
  final error = useState<String?>(null);

  Future<void> fetchData() async {
    isLoading.value = true;
    try {
      final url = Uri.parse("https://cardinaldailyquotes.com/api/audios/$category");
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final decoded = jsonDecode(response.body);
        if (decoded["status"] == "success") {
          
          sounds.value = [SoundsModel.fromJson(decoded)];
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

  return FetchSoundsCategoryResult(
    sounds: sounds.value,
    isLoading: isLoading.value,
    error: error.value,
  );
}

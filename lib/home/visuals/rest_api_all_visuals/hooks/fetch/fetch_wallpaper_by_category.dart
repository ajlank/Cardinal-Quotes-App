import 'dart:convert';
import 'package:cardinal_quotes_app/home/visuals/rest_api_all_visuals/hooks/result/fetch_wallpaper_results.dart';
import 'package:cardinal_quotes_app/home/visuals/rest_api_all_visuals/model/wallpaper_model.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:http/http.dart' as http;

FetchAllVisualsResult fetchVisualByCategory(String category){
  final wallPaper = useState<List<WallPaperModel>>([]);
  final isLoading = useState(false);
  final error = useState<String?>(null);
 
  Future<void> fetchData() async {
    isLoading.value = true;
    try {
      final url = Uri.parse("https://cardinaldailyquotes.com/api/visuals/$category");
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final decoded = jsonDecode(response.body);
        if (decoded["status"] == "success") {
          
          wallPaper.value = [WallPaperModel.fromJson(decoded)];
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

  return FetchAllVisualsResult(wallpaper: wallPaper.value,
   isLoading: isLoading.value, error: error.value,
   refetch: refetch
   );
}

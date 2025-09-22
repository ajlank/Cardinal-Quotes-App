
import 'package:cardinal_quotes_app/home/rest_api_all_visuals/model/wallpaper_model.dart';

class FetchAllVisualsResult {
    
    final List<WallPaperModel> wallpaper;
    final bool isLoading;
    final String? error;

  FetchAllVisualsResult({required this.wallpaper, 
  required this.isLoading, 
  required this.error});

 
  
}
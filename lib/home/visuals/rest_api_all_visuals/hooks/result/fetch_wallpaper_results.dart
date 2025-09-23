
import 'package:cardinal_quotes_app/home/visuals/rest_api_all_visuals/model/wallpaper_model.dart';
import 'package:flutter/material.dart';

class FetchAllVisualsResult {
    
    final List<WallPaperModel> wallpaper;
    final bool isLoading;
    final String? error;
    final VoidCallback refetch;
  FetchAllVisualsResult({required this.wallpaper, 
  required this.isLoading, 
  required this.error,
  required this.refetch
  });

 
  
}
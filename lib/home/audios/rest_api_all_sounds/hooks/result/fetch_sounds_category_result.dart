
import 'package:cardinal_quotes_app/home/audios/rest_api_all_sounds/model/sounds_model.dart';
import 'package:flutter/material.dart';

class FetchSoundsCategoryResult {
    
    final List<SoundsModel> sounds;
    final bool isLoading;
    final String? error;
    final VoidCallback refetch;
    FetchSoundsCategoryResult({required this.sounds, required this.isLoading,
     required this.error,required this.refetch});
  
}
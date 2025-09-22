
import 'package:cardinal_quotes_app/home/rest_api_all_sounds/model/sounds_model.dart';

class FetchSoundsCategoryResult {
    
    final List<SoundsModel> sounds;
    final bool isLoading;
    final String? error;

    FetchSoundsCategoryResult({required this.sounds, required this.isLoading, required this.error});
  
}
import 'package:cardinal_quotes_app/home/save_backends/model/save_post_response.dart';

class FetchSavedPostsResult {
  final List<Audio> audios;
  final List<Quote> quotes;
  final List<Visual> visuals;
  final bool isLoading;
  final String? error;

  FetchSavedPostsResult({
    required this.audios,
    required this.quotes,
    required this.visuals,
    required this.isLoading,
    required this.error,
  });
}
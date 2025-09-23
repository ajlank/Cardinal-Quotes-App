import 'package:cardinal_quotes_app/home/quotes/save_backends/model/save_post_response.dart';

class GetPostsResult {

 final List<Audio> audios;
  final List<Quote> quotes;
  final List<Visual> visuals;
  final bool isLoading;
  final String? error;

  GetPostsResult({required this.audios, required this.quotes, required this.visuals, required this.isLoading, required this.error});

 

}

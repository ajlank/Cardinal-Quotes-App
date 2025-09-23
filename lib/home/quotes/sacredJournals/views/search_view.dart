import 'package:cardinal_quotes_app/home/save/widgets/contents/audio_content.dart';
import 'package:cardinal_quotes_app/home/save/widgets/contents/quote_content.dart';
import 'package:cardinal_quotes_app/home/save/widgets/contents/wallpaper_content.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controller/user_search_controller.dart';


class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  late final TextEditingController _searchController;

  @override
  void initState() {
    _searchController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final wid = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(title: Text('Search')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    decoration:
                        InputDecoration(hintText: 'type keyword (eg:grief_loss,popular)'),
                  ),
                ),
                SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {
                    if (_searchController.text.isNotEmpty) {
                      context
                          .read<UserSearchController>()
                          .searchFunction(_searchController.text);
                    }
                  },
                  child: Text('Search'),
                ),
              ],
            ),
          ),
          Expanded(
            child: Consumer<UserSearchController>(
              builder: (context, value, child) {
                if (value.isLoading) {
                  return Center(child: CircularProgressIndicator());
                }
                if (value.error.isNotEmpty) {
                  return Center(child: Text('Error: ${value.error}'));
                }
                if (value.audios.isEmpty &&
                    value.quotes.isEmpty &&
                    value.visuals.isEmpty) {
                  return Center(child: Text('No results'));
                }

                return SingleChildScrollView(
                  child: Column(
                    children: [
                      AudioContent(audio: value.audios),
                      QuoteContent(quote: value.quotes),
                      WallpaperContent(visual: value.visuals),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

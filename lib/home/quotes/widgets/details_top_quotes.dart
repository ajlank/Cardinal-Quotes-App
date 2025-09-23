import 'package:cardinal_quotes_app/home/quotes/rest_api_all_quotes/model/quotes_model.dart';
import 'package:cardinal_quotes_app/home/quotes/sacredJournals/services/api/view_increement.dart';
import 'package:cardinal_quotes_app/home/quotes/save_backends/controller/post_save_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailsTopQuotes extends StatelessWidget {
  const DetailsTopQuotes({super.key, required this.item});
  final QuotesData? item;
  @override
  Widget build(BuildContext context) {
    final wid = MediaQuery.of(context).size.width;
    return SizedBox(
      height: 310,
      child: GestureDetector(
        onTap: () {
          increaseView('quote',item!.id);
        },
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  (item!.isText == 0)
                      ? Image.network(
                        item!.quote,
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: 200,
                        fit: BoxFit.cover,
                      )
                      : Container(
                        height: 150,
                        width: wid*.90,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 181, 200, 182)
                        ),
                        child: Center(
                          child: Text(
                              item!.quote,
                              
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.white
                              ),
                              textAlign: TextAlign.center,
                            ),
                        ),
                      ),
                ],
              ),
            ),
        
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6.5, vertical: 12),
              child: Column(
                children: [
                  SizedBox(height: 4),
                  Row(
                    children: List.generate(item!.keywords.length, (i) {
                      var tag = item!.keywords[i];
                      return Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Text(
                          "#$tag",
                          style: TextStyle(color: Colors.white),
                        ),
                      );
                    }),
                  ),
                  SizedBox(height: 6),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 12),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Image.asset('assets/sleep_sounds/eye.png'),
                                SizedBox(width: 3),
                                Text(
                                  item!.viewCount.toString(),
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
        
                      Padding(
                        padding: const EdgeInsets.only(right: 12),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Image.asset('assets/sleep_sounds/share.png'),
                                SizedBox(width: 3),
                                Text(
                                  'Share',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 12),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Image.asset('assets/sleep_sounds/download.png'),
                                SizedBox(width: 3),
                                Text(
                                  'Download',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 12),
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                context.read<PostSaveController>().savePost('quote', item!.id);
                              },
                              child: Row(
                                children: [
                                  Image.asset('assets/sleep_sounds/save.png'),
                                  SizedBox(width: 3),
                                  Text(
                                    'Save',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

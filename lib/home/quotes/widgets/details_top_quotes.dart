import 'package:cardinal_quotes_app/home/quotes/model/topquotes_model.dart';
import 'package:cardinal_quotes_app/utils/appRoutes/constants/constant.dart';
import 'package:flutter/material.dart';

class DetailsTopQuotes extends StatelessWidget {
  const DetailsTopQuotes({super.key, required this.item});
  final TopQuotesModel? item;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(soundDetailsRoute);
      },
      child: SizedBox(
        height: 340,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    item!.image,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Text(
                    item!.centerText,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 6.5,
                vertical: 12,
              ),
              child: Column(
                children: [
                  SizedBox(height: 4),
                  Row(
                    children: List.generate(item!.tags.length, (i) {
                      var tag = item!.tags[i];
                      return Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Text(tag, style: TextStyle(color: Colors.white)),
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
                                  '577777k',
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
                            Row(
                              children: [
                                Image.asset('assets/sleep_sounds/save.png'),
                                SizedBox(width: 3),
                                Text(
                                  'Save',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
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

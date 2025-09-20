import 'package:cardinal_quotes_app/home/sleepsounds/model/sleep_sounds_model.dart';
import 'package:cardinal_quotes_app/utils/appRoutes/constants/constant.dart';
import 'package:flutter/material.dart';

class DetailsS extends StatelessWidget {
  const DetailsS({super.key,required this.item});
  final SleepSoundsModel? item;
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
              borderRadius: BorderRadiusGeometry.circular(12),
              child: Image.asset(item!.image),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 6.5,
                vertical: 12,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Column(
                        children: [
                          Text(
                            item!.title,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
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

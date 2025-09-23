// details_s.dart
import 'package:cardinal_quotes_app/home/audios/rest_api_all_sounds/model/sounds_model.dart';
import 'package:cardinal_quotes_app/home/quotes/sacredJournals/services/api/view_increement.dart';
import 'package:cardinal_quotes_app/home/quotes/save_backends/controller/post_save_controller.dart';
import 'package:cardinal_quotes_app/home/visuals/wallpapers/widgets/icon_with_text.dart';
import 'package:cardinal_quotes_app/utils/appRoutes/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailsS extends StatelessWidget {
  const DetailsS({super.key, required this.item});
  final Data? item;

  @override
  Widget build(BuildContext context) {
    if (item == null) return const SizedBox();

    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(soundDetailsRoute);
        increaseView('audio', item!.id);  
      },
      child: SizedBox(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  item!.imgPath ?? '',
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6.5, vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item!.name ?? "Unknown",
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 4),
                    Wrap(
                      spacing: 10,
                      children: List.generate(item!.keywords.length, (i){
                        var tag= item!.keywords[i];
                        return Text("#$tag", style: const TextStyle(color: Colors.white));
                      })
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        IconWithText(asset:'assets/sleep_sounds/eye.png' , text:item!.viewCount.toString()),
                        const SizedBox(width: 12),
                         IconWithText(asset:'assets/sleep_sounds/share.png',text:'Share'),
                        const SizedBox(width: 12),
                         IconWithText(asset:'assets/sleep_sounds/download.png',text:'Download'),
                        const SizedBox(width: 12),
                         GestureDetector(
                          onTap: () {
                            
                            context.read<PostSaveController>().savePost("audio", item!.id);
                          },
                          child: IconWithText(asset:'assets/sleep_sounds/save.png',text:'Save')),
                       
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

 
}

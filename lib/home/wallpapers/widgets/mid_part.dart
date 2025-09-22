import 'package:cardinal_quotes_app/home/controller/bottom_nav_notifier.dart';
import 'package:cardinal_quotes_app/home/rest_api_all_visuals/model/wallpaper_model.dart';
import 'package:cardinal_quotes_app/home/wallpapers/widgets/item_pannel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';

class MidPart extends HookWidget {
  const MidPart({super.key, required this.wallPaper});

  final List<WallPaperData> wallPaper;

  @override
  Widget build(BuildContext context) {

    return Expanded(
      child: GridView.builder(
        itemCount: wallPaper.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          childAspectRatio: 0.9,
        ),
        itemBuilder: (context, i) {
          var item = wallPaper[i];
 
          return Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8, right: 8),
                    child: Row(
                      children: [
                        Expanded(
                          child: Wrap(
                            spacing: 4,
                            runSpacing: 2,
                            children: List.generate(item.keywords.length, (i){
                              var tag=item.keywords[i];
                              return Text(
                                "#$tag",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              );
                            })
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            context
                                .read<BottomNavNotifier>()
                                .setSelectedItem(item.id);
                                // context.read<BottomNavNotifier>().isClickedd=true;
                          },
                          child: const Icon(
                            Icons.more_vert,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 9),

                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: Image.network(
                        item.imagePath,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) =>
                            const Center(
                          child: Icon(Icons.broken_image, color: Colors.grey),
                        ),
                      ),
                    ),
                  ),
                
                ],
              ),

      
              if (context.watch<BottomNavNotifier>().isClickedd==true && context.read<BottomNavNotifier>().selectedItemIds == item.id)
                Positioned(
                  right: 0,
                  top: 0,
                  child: ItemPannel(viewCount: item.viewCount, id: item.id,),
                ),
            ],
          );
        },
      ),
    );
  }
}

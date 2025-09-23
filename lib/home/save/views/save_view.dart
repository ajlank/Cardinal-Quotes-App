import 'package:cardinal_quotes_app/home/save/widgets/contents/audio_content.dart';
import 'package:cardinal_quotes_app/home/save/widgets/contents/memorial_content.dart';
import 'package:cardinal_quotes_app/home/save/widgets/contents/quote_content.dart';
import 'package:cardinal_quotes_app/home/save/widgets/contents/wallpaper_content.dart';
import 'package:cardinal_quotes_app/home/quotes/save_backends/hooks/fetch/fetch_save_post.dart';
import 'package:cardinal_quotes_app/home/quotes/save_backends/model/save_post_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';
import 'package:cardinal_quotes_app/home/save/widgets/top_save_header.dart';
import 'package:cardinal_quotes_app/home/controller/bottom_nav_notifier.dart';

class SaveView extends HookWidget{
  const SaveView({super.key});
  final List<String> tabs = const [
    "Audios",
    "Quotes",
    "Wallpaper",
    "Memorial Cards",
  ];
  final List<String> tabIcons = const [
    'assets/save_items/Audio.png',
    'assets/body_grid_items/top_quotes.png',
    'assets/save_items/wallpaper.png',
    'assets/save_items/memorial_icon.png',
  ];
  @override
  Widget build(BuildContext context) {
    final bottomNav = context.watch<BottomNavNotifier>();

    final result=userFetchSavedPosts();
    if(result.isLoading){
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    // if(result.error){
    //    return Scaffold(
    //     body: Center(
    //       child: Text('Error: ${result.error}')
    //     ),
    //   );
    // }
    final audios=result.audios;
    final visuals=result.visuals;
    final quotes=result.quotes;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 181, 25, 14),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
          child: Column(
            children: [
              Row(children: [
                TopSaveHeader()]),
              const SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(tabs.length, (index) {
                    bool isSelected = bottomNav.selectedTabIndex == index;
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6),
                      child: GestureDetector(
                        onTap: () {
                          bottomNav.setTabIndex(index);
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? const Color.fromARGB(255, 241, 233, 172)
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(25),
                            border: Border.all(color: Colors.white, width: 1.5),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset(
                                tabIcons[index],
                                width: 20,
                                height: 20,
                                color: isSelected
                                    ? const Color(0xFF4A3A2A)
                                    : Colors.white,
                              ),
                              const SizedBox(width: 6),
                              Text(
                                tabs[index],
                                style: TextStyle(
                                  color: isSelected
                                      ? const Color(0xFF4A3A2A)
                                      : Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
              const SizedBox(height: 15),
              Expanded(
                child: Stack(
                  children: [
                    IndexedStack(
                      index: bottomNav.selectedTabIndex,
                      children: [
                        
                        AudioContent(audio: audios),
                        QuoteContent(quote: quotes),
                       WallpaperContent(visual: visuals),
                       MemorialContent()
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

import 'package:cardinal_quotes_app/home/controller/bottom_nav_notifier.dart';
import 'package:cardinal_quotes_app/home/save/widgets/action_item.dart';
import 'package:cardinal_quotes_app/home/quotes/save_backends/model/save_post_response.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AudioContent extends StatelessWidget {
  const AudioContent({super.key, required this.audio});
  final List<Audio> audio;


  @override
  Widget build(BuildContext context) {
    final bottomNav = Provider.of<BottomNavNotifier>(context, listen: true);
  final screenWidth = MediaQuery.of(context).size.width;
    var audios=audio;
    return SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(audios.length, (i){
           var aud=audios[i];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
              ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.network(aud.imgPath),
                ),
                const SizedBox(height: 12),
        
            Text(
        aud.name,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
                ),
                const SizedBox(height: 6),
                TweenAnimationBuilder<Offset>(
        tween: Tween<Offset>(
          begin: Offset(0, 0), 
          end: bottomNav.selectedTabIndex == 0? Offset(0, 0) : Offset(300, -300),
        ),
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
        builder: (context, offset, child) {
          return Transform.translate(
            offset: offset,
            child: Opacity(
              opacity: bottomNav.selectedTabIndex == 1 ? 0 : 1,
              child: Row(
                children: List.generate(aud.keywords.length, (i){
                  var k=aud.keywords[i];

                  return Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: Text('#$k', style: TextStyle(color: Colors.white)),
                  );
                })
              ),
            ),
          );
        },
                ),
                const SizedBox(height: 5),
        
                Row(
        children: [
           ActionItem(iconPath:'assets/sleep_sounds/eye.png', label:aud.viewCount.toString()),
           ActionItem(iconPath: 'assets/sleep_sounds/share.png', label: 'Share'),
           ActionItem(iconPath: 'assets/sleep_sounds/download.png', label: 'Download'),
           ActionItem(iconPath: 'assets/sleep_sounds/save.png', label: 'Remove'),
       
        ],
                ),
        ],);
      })
    ),
  );
  }

}

import 'package:flutter/material.dart';

class TurnOnFeatureWallpaper extends StatelessWidget {
     final List<String> wallpapers=[
      'assets/turn_on_featured_wallpaper/1.png',
      'assets/turn_on_featured_wallpaper/2.png',
      'assets/turn_on_featured_wallpaper/3.png',
   ];


   TurnOnFeatureWallpaper({super.key});

  @override
  Widget build(BuildContext context) {
    
    return SizedBox(
      height: 130, 
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
        itemCount: wallpapers.length,
        itemBuilder: (context, i) {
          return Container(
            margin: const EdgeInsets.only(right: 16),
            height: 100,
            width: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
               image: DecorationImage(
                image: AssetImage(wallpapers[i]),
                fit: BoxFit.fill,
              ),
            ),
           
          );
        },
      ),
    );
  }
}
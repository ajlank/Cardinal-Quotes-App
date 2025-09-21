import 'package:flutter/material.dart';

class WallpaperWidget extends StatelessWidget {
  const WallpaperWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Center(
          child: Text(
            "Wallpaper Tab",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      ),
    );
  }
}
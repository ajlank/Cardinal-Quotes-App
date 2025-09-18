import 'package:flutter/material.dart';

class FeatureWallpaper extends StatelessWidget {
  const FeatureWallpaper({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Container(
            height: 100,
          
            width: 120,
            decoration: BoxDecoration(
             color: Colors.amber,
             borderRadius: BorderRadius.circular(12)
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              
            ),
          ),
           Container(
            height: 100,
          
            width: 120,
            decoration: BoxDecoration(
             color: Colors.amber,
             borderRadius: BorderRadius.circular(12)
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              
            ),
          ),
           Container(
          height: 100,
        
          width: 120,
          decoration: BoxDecoration(
           color: Colors.amber,
           borderRadius: BorderRadius.circular(12)
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            
          ),
        )
        ],
      ),
    );
  }
}
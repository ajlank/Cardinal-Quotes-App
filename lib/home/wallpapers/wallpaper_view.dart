import 'package:cardinal_quotes_app/home/controller/bottom_nav_notifier.dart';
import 'package:cardinal_quotes_app/home/wallpapers/widgets/item_pannel.dart';
import 'package:cardinal_quotes_app/home/wallpapers/widgets/mid_part.dart';
import 'package:cardinal_quotes_app/home/wallpapers/widgets/top_part.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WallPaperView extends StatelessWidget {
  const WallPaperView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE04A1D),
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                 TopPart(),
                  const SizedBox(height: 20),
                  MidPart(),
                ],
              ),
            ),

            if (context.watch<BottomNavNotifier>().isClicked == true)
              Positioned(
                left: 10,
                top: 60,
                child: ItemPannel(),
              ),
          ],
        ),
      ),
    );
  }
}

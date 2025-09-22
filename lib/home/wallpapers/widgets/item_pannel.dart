import 'package:cardinal_quotes_app/home/controller/bottom_nav_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ItemPannel extends StatelessWidget {
  const ItemPannel({super.key, required this.viewCount});
  final int viewCount;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        padding: EdgeInsets.only(bottom: 15),
        width: 150,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 241, 233, 172),
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 4,
              offset: Offset(2, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 30,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    icon: const Icon(Icons.close, size: 18),
                    onPressed: () {
                      context.read<BottomNavNotifier>().setIsClickedd(false);
                    },
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/sleep_sounds/eye.png',
                      width: 20,
                      height: 20,
                      color: Color(0xFF4A3A2A),
                      colorBlendMode: BlendMode.srcIn,
                    ),
                    const SizedBox(width: 11),
                     Text(viewCount.toString()),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/sleep_sounds/save.png',
                      width: 20,
                      height: 20,
                      color: Color(0xFF4A3A2A),
                      colorBlendMode: BlendMode.srcIn,
                    ),
                    const SizedBox(width: 11),
                    const Text('Save'),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/sleep_sounds/share.png',
                      width: 20,
                      height: 20,
                      color: Color(0xFF4A3A2A),
                    ),
                    const SizedBox(width: 11),
                    const Text('Share'),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/sleep_sounds/download.png',
                      width: 20,
                      height: 20,
                      color: Color(0xFF4A3A2A),
                    ),
                    const SizedBox(width: 11),
                    const Text('Download'),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/body_grid_items/save.png',
                      width: 20,
                      height: 20,
                      color: Color(0xFF4A3A2A),
                    ),
                    const SizedBox(width: 11),
                    const Text('Set'),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

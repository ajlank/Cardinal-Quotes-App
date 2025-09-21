import 'package:flutter/material.dart';
class AudiosWidget extends StatelessWidget {
  const AudiosWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset('assets/sleep_sounds/music1.png'),
        ),
        const SizedBox(height: 12),
        const Row(
          children: [
            Text(
              'Music: Wiper',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        const SizedBox(height: 6),

        // ✅ Hero only around tags row
        Hero(
          tag: 'tagsRowHero',
          child: Row(
            children: const [
              Padding(
                padding: EdgeInsets.only(right: 10),
                child: Text('#Ambition', style: TextStyle(color: Colors.white)),
              ),
              Padding(
                padding: EdgeInsets.only(right: 10),
                child: Text('#Inspiration', style: TextStyle(color: Colors.white)),
              ),
              Padding(
                padding: EdgeInsets.only(right: 10),
                child: Text('#Motivational', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),

        const SizedBox(height: 5),
        Row(
          children: [
            _actionItem('assets/sleep_sounds/eye.png', '577777k'),
            _actionItem('assets/sleep_sounds/share.png', 'Share'),
            _actionItem('assets/sleep_sounds/download.png', 'Download'),
            _actionItem('assets/sleep_sounds/save.png', 'Save'),
          ],
        ),
      ],
    );
  }

  static Widget _actionItem(String iconPath, String label) {
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: Row(
        children: [
          Image.asset(iconPath, width: 20, height: 20),
          const SizedBox(width: 3),
          Text(label, style: const TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}

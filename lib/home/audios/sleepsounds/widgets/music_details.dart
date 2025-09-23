import 'package:flutter/material.dart';

class MusicDetails extends StatelessWidget {
  const MusicDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Music: Owl',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 6),
        Row(
          children: const [
            Text('#Ambition', style: TextStyle(color: Colors.white)),
            SizedBox(width: 7),
            Text('#Inspiration', style: TextStyle(color: Colors.white)),
            SizedBox(width: 7),
            Text('#Motivational', style: TextStyle(color: Colors.white)),
          ],
        ),
        const SizedBox(height: 6),
        Row(
          children: [
            Row(
              children: [
                Image.asset('assets/sleep_sounds/eye.png'),
                const SizedBox(width: 3),
                const Text('577777k', style: TextStyle(color: Colors.white)),
              ],
            ),
            const SizedBox(width: 15),

            Row(
              children: [
                Image.asset('assets/sleep_sounds/share.png'),
                const SizedBox(width: 3),
                const Text('Share', style: TextStyle(color: Colors.white)),
              ],
            ),
            const SizedBox(width: 15),

            Row(
              children: [
                Image.asset('assets/sleep_sounds/download.png'),
                const SizedBox(width: 3),
                const Text('Download', style: TextStyle(color: Colors.white)),
              ],
            ),
            const SizedBox(width: 15),
            // Save
            Row(
              children: [
                Image.asset('assets/sleep_sounds/save.png'),
                const SizedBox(width: 3),
                const Text('Save', style: TextStyle(color: Colors.white)),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

class MusicControllerPannel extends StatelessWidget {
  const MusicControllerPannel({super.key, required this.ht, required this.wid});
  final double ht;
  final double wid;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            child: SizedBox(
              width: wid * 0.8,
              height: ht * 0.3,
              child: Stack(
                children: [
                  Positioned(
                    right: 65,
                    top: 50,
                    height: 190,
                    child: Image.asset(
                      'assets/sleep_sounds/play_button/Ellipse1.png',
                    ),
                  ),
                  Positioned(
                    right: 130,
                    top: 115,
                    child: Image.asset(
                      'assets/sleep_sounds/play_button/Ellipse2.png',
                    ),
                  ),
                  Positioned(
                    right: 145,
                    top: 133,
                    child: Image.asset(
                      'assets/sleep_sounds/play_button/Vector.png',
                    ),
                  ),

                  Positioned(
                    right: 10,
                    top: 10,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 120,
                          child: RotatedBox(
                            quarterTurns: -1,
                            child: LinearProgressIndicator(
                              value: 0.6,
                              minHeight: 12,
                              backgroundColor: Colors.grey[300],
                              valueColor: const AlwaysStoppedAnimation<Color>(
                                Color(0xFF4A3A2A),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Image.asset('assets/sleep_sounds/speaker.png'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

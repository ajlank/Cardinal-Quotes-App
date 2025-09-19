import 'package:flutter/material.dart';

class TopBottom extends StatelessWidget {
  const TopBottom({super.key, required this.controller, required this.animation, required this.ht, required this.wid});
 final AnimationController controller;
  final Animation<double> animation;
  final double ht;
  final double wid;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: ht * 0.38,
      width: wid * 0.75,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 241, 233, 172),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Image.asset('assets/sleep_sounds/bg.png'),
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedBuilder(
                animation: animation,
                builder: (context, child) {
                  return Transform.scale(
                    scaleY: animation.value,
                    scaleX: 1,
                    child: child,
                  );
                },
                child: Image.asset('assets/sleep_sounds/frequency.png'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

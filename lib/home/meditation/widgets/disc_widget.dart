import 'package:flutter/material.dart';

class DiscWidget extends StatefulWidget {
  const DiscWidget({
    super.key,
    required this.controller,
    required this.animation,
    required this.ht,
    required this.wid,
  });

  final AnimationController controller;
  final Animation<double> animation;
  final double ht;
  final double wid;

  @override
  State<DiscWidget> createState() => _DiscWidgetState();
}

class _DiscWidgetState extends State<DiscWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.ht * 0.38,
      width: widget.wid * 0.75,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: AnimatedBuilder(
              animation: widget.animation,
              builder: (context, child) {
                return Transform.scale(
                  scale: widget.animation.value,
                  child: Transform.rotate(
                    angle: widget.controller.value,
                    child: Image.asset('assets/sleep_sounds/player_disc.png'),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 4),
        ],
      ),
    );
  }
}

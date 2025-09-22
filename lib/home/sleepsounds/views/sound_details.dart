import 'package:cardinal_quotes_app/home/sleepsounds/widgets/bar.dart';
import 'package:cardinal_quotes_app/home/sleepsounds/widgets/music_controller_pannel.dart';
import 'package:cardinal_quotes_app/home/sleepsounds/widgets/music_details.dart';
import 'package:cardinal_quotes_app/home/sleepsounds/widgets/timer_pannel.dart';
import 'package:cardinal_quotes_app/home/sleepsounds/widgets/top_bottom.dart';
import 'package:cardinal_quotes_app/home/sleepsounds/widgets/top_header.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SoundDetails extends StatefulWidget {
  const SoundDetails({super.key});

  @override
  State<SoundDetails> createState() => _SoundDetailsState();
}

class _SoundDetailsState extends State<SoundDetails>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: 0.7, end: 1.3).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final wid = MediaQuery.of(context).size.width;
    final ht = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 181, 25, 14),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              TopHeader(headerTitle: '',),
              const SizedBox(height: 60),
              TopBottom(controller: _controller,animation: _animation, ht: ht, wid: wid),
              const SizedBox(height: 20),
              MusicControllerPannel(ht: ht, wid: wid),
               TimerPannel(),
               const SizedBox(height: 4),
               Bar(),
              const SizedBox(height: 12),
               MusicDetails(),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }
}

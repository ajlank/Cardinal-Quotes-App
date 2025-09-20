import 'package:cardinal_quotes_app/home/meditation/widgets/disc_widget.dart';
import 'package:cardinal_quotes_app/home/sleepsounds/widgets/bar.dart';
import 'package:cardinal_quotes_app/home/sleepsounds/widgets/music_controller_pannel.dart';
import 'package:cardinal_quotes_app/home/sleepsounds/widgets/music_details.dart';
import 'package:cardinal_quotes_app/home/sleepsounds/widgets/timer_pannel.dart';
import 'package:flutter/material.dart';

class MeditationView extends StatefulWidget {
  const MeditationView({super.key});

  @override
  State<MeditationView> createState() => _MeditationViewState();
}

class _MeditationViewState extends State<MeditationView>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _animation = Tween<double>(
      begin: 0.7,
      end: 1.3,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
    _controller.forward();
    _controller.addStatusListener((status) async {
      if (status == AnimationStatus.completed) {
        await Future.delayed(const Duration(seconds: 1));
        _controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        await Future.delayed(const Duration(seconds: 1));
        _controller.forward();
      }
    });
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
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: Image.asset('assets/sleep_sounds/right_arrow.png'),
                  ),
                  const SizedBox(width: 7),
                  const Text(
                    'Meditation',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 60),
              DiscWidget(
                controller: _controller,
                animation: _animation,
                ht: ht,
                wid: wid,
              ),
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

import 'package:cardinal_quotes_app/home/controller/bottom_nav_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomNavWid extends StatelessWidget {
  const BottomNavWid({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(33),
        topRight: Radius.circular(33),
      ),
      child: Stack(
        children: [
          BottomNavigationBar(
            showSelectedLabels: true,
            showUnselectedLabels: true,
            unselectedItemColor: Colors.blueGrey,
            selectedItemColor: Color(0xFF4A3A2A),
            currentIndex: context.watch<BottomNavNotifier>().currentIndex,
            backgroundColor: const Color.fromARGB(255, 241, 233, 172),
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                icon: Image.asset(
                  (context.watch<BottomNavNotifier>().currentIndex == 0)
                      ? 'assets/bottomNavIc/home.png'
                      : 'assets/bottomNavIc/home_music_untapped/home.png',
                  height: 24,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  (context.watch<BottomNavNotifier>().currentIndex == 1)
                      ? 'assets/bottomNavIc/music.png'
                      : 'assets/bottomNavIc/home_music_untapped/music.png',
                  height: 24,
                ),
                label: 'Sounds',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  (context.watch<BottomNavNotifier>().currentIndex == 2)
                      ? 'assets/bottomNavIc/soul.png'
                      : 'assets/bottomNavIc/soul_quote_more_untapped/solar_user-heart-broken.png',
                  height: 24,
                ),
                label: 'Soul',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  (context.watch<BottomNavNotifier>().currentIndex == 3)
                      ? 'assets/bottomNavIc/top.png'
                      : 'assets/bottomNavIc/soul_quote_more_untapped/top.png',
                  height: 24,
                ),
                label: 'Top',
              ),
              BottomNavigationBarItem(
                icon: GestureDetector(
                  onTap: () {
                    context.read<BottomNavNotifier>().setIsClosed(true);
                  },
                  child: Image.asset(
                    (context.watch<BottomNavNotifier>().currentIndex == 4)
                        ? 'assets/bottomNavIc/more.png'
                        : 'assets/bottomNavIc/soul_quote_more_untapped/ri_more-2-fill.png',
                    height: 24,
                  ),
                ),
                label: 'More',
              ),
            ],
            onTap: (v) {
              if (v == 4) {
                context.read<BottomNavNotifier>().setIsClosed(true);
              } else {
                context.read<BottomNavNotifier>().setIndex(v);
              }
           
            },
          ),
        ],
      ),
    );
  }
}

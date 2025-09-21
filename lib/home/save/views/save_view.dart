import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cardinal_quotes_app/home/save/widgets/top_save_header.dart';
import 'package:cardinal_quotes_app/home/controller/bottom_nav_notifier.dart';

class SaveView extends StatelessWidget {
  const SaveView({super.key});
  final List<String> tabs = const [
    "Audios",
    "Quotes",
    "Wallpaper",
    "Memorial Cards",
  ];
  final List<String> tabIcons = const [
    'assets/save_items/Audio.png',
    'assets/body_grid_items/top_quotes.png',
    'assets/save_items/wallpaper.png',
    'assets/save_items/memorial_icon.png',
  ];
  @override
  Widget build(BuildContext context) {
    final bottomNav = context.watch<BottomNavNotifier>();
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 181, 25, 14),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
          child: Column(
            children: [
              Row(children: [TopSaveHeader()]),
              const SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(tabs.length, (index) {
                    bool isSelected = bottomNav.selectedTabIndex == index;
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6),
                      child: GestureDetector(
                        onTap: () {
                          bottomNav.setTabIndex(index);
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? const Color.fromARGB(255, 241, 233, 172)
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(25),
                            border: Border.all(color: Colors.white, width: 1.5),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset(
                                tabIcons[index],
                                width: 20,
                                height: 20,
                                color: isSelected
                                    ? const Color(0xFF4A3A2A)
                                    : Colors.white,
                              ),
                              const SizedBox(width: 6),
                              Text(
                                tabs[index],
                                style: TextStyle(
                                  color: isSelected
                                      ? const Color(0xFF4A3A2A)
                                      : Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
              const SizedBox(height: 15),
              Expanded(
                child: Stack(
                  children: [
                    IndexedStack(
                      index: bottomNav.selectedTabIndex,
                      children: [
                        _audioContent(context),
                        _quoteContent(context),
                        _wallpaperContent(),
                        _memorialContent(),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

Widget _audioContent(BuildContext context) {
  final bottomNav = Provider.of<BottomNavNotifier>(context, listen: true);
  final screenWidth = MediaQuery.of(context).size.width;

  return SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
     
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset('assets/sleep_sounds/music1.png'),
        ),
        const SizedBox(height: 12),

        const Text(
          'Music: Wiper',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 6),
        TweenAnimationBuilder<Offset>(
          tween: Tween<Offset>(
            begin: Offset(0, 0), 
            end: bottomNav.selectedTabIndex == 0? Offset(0, 0) : Offset(300, -300),
          ),
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
          builder: (context, offset, child) {
            return Transform.translate(
              offset: offset,
              child: Opacity(
                opacity: bottomNav.selectedTabIndex == 1 ? 0 : 1,
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
            );
          },
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
    ),
  );
}


  Widget _quoteContent(BuildContext context) {
    final bottomNav = Provider.of<BottomNavNotifier>(context, listen: true);
    return SingleChildScrollView(
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              'assets/top_quotes/1.png',
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 12),
          const SizedBox(height: 6),
          Row(
            children: const [
              Padding(
                padding: EdgeInsets.only(right: 10),
                child: Text('#Ambition', style: TextStyle(color: Colors.white)),
              ),
              Padding(
                padding: EdgeInsets.only(right: 10),
                child: Text(
                  '#Inspiration',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 10),
                child: Text(
                  '#Motivational',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
          Row(
            children: [
              _actionItem('assets/sleep_sounds/eye.png', '577777k'),
              _actionItem('assets/sleep_sounds/share.png', 'Share'),
              _actionItem('assets/sleep_sounds/download.png', 'Download'),
              _actionItem('assets/sleep_sounds/save.png', 'Save'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _wallpaperContent() {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Center(
          child: Text(
            "Wallpaper Tab",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      ),
    );
  }

  Widget _memorialContent() {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Center(
          child: Text(
            "Memorial Cards Tab",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      ),
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

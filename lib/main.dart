import 'package:cardinal_quotes_app/home/controller/bottom_nav_notifier.dart';
import 'package:cardinal_quotes_app/home/model/widgets/body_items.dart';
import 'package:cardinal_quotes_app/home/model/widgets/item_builder.dart';
import 'package:cardinal_quotes_app/home/model/widgets/resuable/home/features/announcement.dart';
import 'package:cardinal_quotes_app/home/model/widgets/resuable/home/features/feature_memorial_cards.dart';
import 'package:cardinal_quotes_app/home/model/widgets/resuable/home/features/feature_wallpaper.dart';
import 'package:cardinal_quotes_app/home/model/widgets/resuable/home/features/featured_quotes.dart';
import 'package:cardinal_quotes_app/home/model/widgets/resuable/home/reusable_header.dart';
import 'package:cardinal_quotes_app/utils/data/data_app_barr.dart';
import 'package:cardinal_quotes_app/utils/data/data_body_items.dart';
import 'package:flutter/material.dart';
import 'package:cardinal_quotes_app/home/model/widgets/drawerpart.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(providers: [
    ChangeNotifierProvider(create: (context)=>BottomNavNotifier())
    ],
    child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cardinal Quotes',
      theme: ThemeData(),
      home: const HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
      drawer: Drawerpart(),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(33),
          topRight: Radius.circular(33),
        ),
        child: Stack(
          children:[ BottomNavigationBar(
            showSelectedLabels: true,
            showUnselectedLabels: true,
            unselectedItemColor: Colors.blueGrey,
            selectedItemColor:Color(0xFF4A3A2A),
            currentIndex: context.watch<BottomNavNotifier>().currentIndex,
            backgroundColor: const Color.fromARGB(255, 241, 233, 172),
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                icon: Image.asset(
                 (context.watch<BottomNavNotifier>().currentIndex==0)?'assets/bottomNavIc/home.png' :'assets/bottomNavIc/home_music_untapped/home.png',
                  height: 24,
                ),
                label: 'Home',
              ),
               BottomNavigationBarItem(
                 icon: Image.asset(
                 (context.watch<BottomNavNotifier>().currentIndex==1)? 'assets/bottomNavIc/music.png':'assets/bottomNavIc/home_music_untapped/music.png',
                  height: 24,
                ),
                label: 'Sounds',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  (context.watch<BottomNavNotifier>().currentIndex==2)? 'assets/bottomNavIc/soul.png':'assets/bottomNavIc/soul_quote_more_untapped/solar_user-heart-broken.png',
                  height: 24,
                ),
                label: 'Soul',
              ),
               BottomNavigationBarItem(
                icon: Image.asset(
                 (context.watch<BottomNavNotifier>().currentIndex==3)?'assets/bottomNavIc/top.png' :'assets/bottomNavIc/soul_quote_more_untapped/top.png',
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
                    (context.watch<BottomNavNotifier>().currentIndex==4)?'assets/bottomNavIc/more.png':'assets/bottomNavIc/soul_quote_more_untapped/ri_more-2-fill.png',
                    height: 24,
                                    ),
                  ),
                label: 'More',
              
              ),
            ],
            onTap: (v) {
              context.read<BottomNavNotifier>().setIndex(v);
            },
          ),
          
          ]
        ),
      ),

      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 181, 25, 14),
        iconTheme: const IconThemeData(
          color: Color.fromARGB(255, 241, 233, 172),
        ),
        toolbarHeight: 80,
        centerTitle: false,
        title: LayoutBuilder(
          builder: (context, constraints) {
            return SizedBox(
              height: 40,
              width: constraints.maxWidth,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemCount: appBarItems.length,
                  itemBuilder: (context, index) {
                    final item = appBarItems[index];
                    return ItemBuilder(items: item);
                  },
                ),
              ),
            );
          },
        ),
      ),

      backgroundColor: const Color.fromARGB(255, 181, 25, 14),
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: GridView.count(
                crossAxisCount: 3,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: List.generate(bodyItems.length, (index) {
                  var bodyItem = bodyItems[index];
                  return BodyItems(bodyItem: bodyItem);
                }),
              ),
            ),
            SizedBox(height: 40),
            ReusableHeader(
              leftText: 'Featured Wallpaper',
              rightText: 'See All',
            ),
            SizedBox(height: 10),
            FeatureWallpaper(),
            SizedBox(height: 10),
            ReusableHeader(leftText: 'Featured Quotes', rightText: 'See All'),
            SizedBox(height: 10),
            FeaturedQuotes(),
            SizedBox(height: 10),
            ReusableHeader(
              leftText: 'Featured Memorial Cards',
              rightText: 'See All',
            ),
            SizedBox(height: 10),
            FeatureMemorialCards(),
            SizedBox(height: 10),
            ReusableHeader(leftText: 'Announcement', rightText: 'See All'),
            SizedBox(height: 20),
            Announcement(),
            SizedBox(height: 200),
          ],
        ),
      ),
    ),
      
 (context.watch<BottomNavNotifier>().isClosed == false)
    ? SizedBox.shrink()
    : Positioned(
        right: 10,
        bottom: 70,
        child: Material(
          borderRadius: BorderRadius.circular(12),
          color: Colors.transparent,
          child: Container(
            width: 170, 
           height: 70,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 241, 233, 172),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        context.read<BottomNavNotifier>().setIsClosed(false);
                      },
                      child: Image.asset(
                        'assets/drawer_items/top/Cancel.png',
                        height: 18,
                        width: 18,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Notifications",
                      style: TextStyle(
                        color: Color(0xFF4A3A2A),
                        fontSize: 14, 
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Transform.scale(
                      scale: 0.6, 
                      child: Switch(
                        value: context.watch<BottomNavNotifier>().switchOn,
                        onChanged: (v) {
                          context.read<BottomNavNotifier>().toggleSwitch();
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),

      ],
    );
  }
}

import 'package:cardinal_quotes_app/auth/views/authentication_view.dart';
import 'package:cardinal_quotes_app/home/controller/bottom_nav_notifier.dart';
import 'package:cardinal_quotes_app/home/homeWidgets/body_items.dart';
import 'package:cardinal_quotes_app/home/homeWidgets/drawerpart.dart';
import 'package:cardinal_quotes_app/home/homeWidgets/item_builder.dart';
import 'package:cardinal_quotes_app/home/homeWidgets/resuable/home/features/announcement.dart';
import 'package:cardinal_quotes_app/home/homeWidgets/resuable/home/features/feature_memorial_cards.dart';
import 'package:cardinal_quotes_app/home/homeWidgets/resuable/home/features/feature_wallpaper.dart';
import 'package:cardinal_quotes_app/home/homeWidgets/resuable/home/features/featured_quotes.dart';
import 'package:cardinal_quotes_app/home/homeWidgets/resuable/home/features/turn_on_feature_quotes.dart';
import 'package:cardinal_quotes_app/home/homeWidgets/resuable/home/features/turn_on_feature_wallpaper.dart';
import 'package:cardinal_quotes_app/utils/appRoutes/constants/constant.dart';
import 'package:cardinal_quotes_app/utils/data/data_app_barr.dart';
import 'package:cardinal_quotes_app/utils/data/data_body_items.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';

class HomeViewWid extends StatelessWidget {
  const HomeViewWid({super.key});

  @override
  Widget build(BuildContext context) {
   String? accessToken=GetStorage().read('accessToken');
     if(accessToken==null){
      return AuthenticationView();
     }
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 181, 25, 14),
      drawer: Drawerpart(),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 181, 25, 14),
        iconTheme: const IconThemeData(
          color: Color.fromARGB(255, 241, 233, 172),
        ),
        toolbarHeight: 80,
        centerTitle: false,
        title: Hero(
          tag: 'top101',
          child: LayoutBuilder(
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
      ),
      body: ListView(
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
                if (bodyItem.id == 15) {
                  return Hero(
                    tag: 'hey101',
                    child: BodyItems(bodyItem: bodyItem),
                  );
                } else {
                  return BodyItems(bodyItem: bodyItem);
                }
              }),
            ),
          ),
          SizedBox(height: 40),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 29),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Featured Wallpaper',
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),

                Row(
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(wallpaperRoute);
                        context
                            .read<BottomNavNotifier>()
                            .setVisualCategoryAndTitle(
                              'wallpaper',
                              'Wallpaper',
                            );
                      },
                      child: const Text(
                        'See All',
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ),

                    Image.asset('assets/body_grid_items/arrow_right.png'),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          (context.watch<BottomNavNotifier>().turnedOn == true)
              ? TurnOnFeatureWallpaper()
              : FeatureWallpaper(),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 29),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Featured Quotes',
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),

                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        context
                            .read<BottomNavNotifier>()
                            .setQuotesCategoryAndTitle(
                              'top_quotes',
                              'Top Quotes',
                            );
                        Navigator.of(context).pushNamed(topQuotesRoute);
                      },
                      child: Text(
                        'See All',
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ),

                    SizedBox(width: 7),
                    Image.asset('assets/body_grid_items/arrow_right.png'),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          (context.watch<BottomNavNotifier>().turnedOn == true)
              ? TurnOnFeatureQuotes()
              : FeaturedQuotes(),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 29),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Featured Memorial Cards',
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),

                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        context
                            .read<BottomNavNotifier>()
                            .setVisualCategoryAndTitle(
                              'memorial_card',
                              'Memorial Cards',
                            );
                        Navigator.of(context).pushNamed(memorialRoute);
                      },
                      child: Text(
                        'See All',
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ),

                    SizedBox(width: 7),
                    Image.asset('assets/body_grid_items/arrow_right.png'),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          FeatureMemorialCards(),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 29),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Announcement',
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),

                Row(
                  children: [
                    Text(
                      'See All',
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),

                    SizedBox(width: 7),
                    Image.asset('assets/body_grid_items/arrow_right.png'),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Announcement(isTrue: context.watch<BottomNavNotifier>().turnedOn),
          SizedBox(height: 200),
        ],
      ),
    );
  }
}

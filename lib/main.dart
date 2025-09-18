import 'package:cardinal_quotes_app/home/model/body_items_model.dart';
import 'package:cardinal_quotes_app/home/model/widgets/body_items.dart';
import 'package:cardinal_quotes_app/home/model/widgets/item_builder.dart';
import 'package:cardinal_quotes_app/home/model/widgets/resuable/home/featureWallpaper/feature_wallpaper.dart';
import 'package:cardinal_quotes_app/home/model/widgets/resuable/home/reusable_header.dart';
import 'package:cardinal_quotes_app/utils/data/data_app_barr.dart';
import 'package:cardinal_quotes_app/utils/data/data_body_items.dart';
import 'package:flutter/material.dart';
import 'package:cardinal_quotes_app/home/model/drawer_item_model.dart';
import 'package:cardinal_quotes_app/home/model/widgets/drawerpart.dart';

void main() {
  runApp(const MyApp());
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
    return Scaffold(
      drawer: Drawerpart(),
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
     body:SafeArea(
  child: Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: ListView(
      children: [
        GridView.count(
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
        SizedBox(
          height: 40,
        ),
        ReusableHeader(leftText: 'Featured Wallpaper', rightText: 'See All >'),
        SizedBox(
          height: 6,
        ),
        FeatureWallpaper()
      ],
    ),
  ),
),

    );
  }
}





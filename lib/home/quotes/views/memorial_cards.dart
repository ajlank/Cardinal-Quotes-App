import 'package:cardinal_quotes_app/home/controller/bottom_nav_notifier.dart';
import 'package:cardinal_quotes_app/home/quotes/widgets/memorial_top.dart';
import 'package:cardinal_quotes_app/home/rest_api_all_visuals/hooks/fetch/fetch_wallpaper_by_category.dart';
import 'package:cardinal_quotes_app/home/wallpapers/widgets/details_visuals.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';

class MemorialCards extends HookWidget {
  const MemorialCards({super.key});

  @override
  Widget build(BuildContext context) {
     final result = fetchVisualByCategory(
      context.read<BottomNavNotifier>().getVisualCategory,
    );

    if (result.isLoading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    if (result.error != null) {
      return Center(child: Text("Error: ${result.error}"));
    }

    if (result.wallpaper.isEmpty || result.wallpaper.first.data.isEmpty) {
      return const Center(child: Text("No visuals found"));
    }

    final visual = result.wallpaper.first.data;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 181, 25, 14),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
             MemorialTop(title: context.read<BottomNavNotifier>().getVisualViewTitle,),
              SizedBox(
                height: 13,
              ),
              Expanded(
                child: ListView.builder(itemCount: visual.length,
                itemBuilder: (context, i) {
                  
                  var item=visual[i];
                  
                  return DetailsVisuals(item: item);
                  },
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}
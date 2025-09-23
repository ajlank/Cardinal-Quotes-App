import 'package:cardinal_quotes_app/home/controller/bottom_nav_notifier.dart';
import 'package:cardinal_quotes_app/home/visuals/rest_api_all_visuals/hooks/fetch/fetch_wallpaper_by_category.dart';
import 'package:cardinal_quotes_app/home/visuals/wallpapers/widgets/mid_part.dart';
import 'package:cardinal_quotes_app/home/visuals/wallpapers/widgets/top_part.dart';
import 'package:cardinal_quotes_app/utils/styles/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';

class WallPaperView extends HookWidget {
  const WallPaperView({super.key});
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

    final wallPaper = result.wallpaper.first.data;

  
    return Scaffold(
  backgroundColor: AppStyles.bgColor,
  body: SafeArea(
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TopPart(),
          const SizedBox(height: 20),
          MidPart(wallPaper: wallPaper),
        ],
      ),
    ),
  ),
);

  }
}

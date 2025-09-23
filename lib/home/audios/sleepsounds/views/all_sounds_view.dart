// all_sounds_view.dart
import 'package:cardinal_quotes_app/auth/views/authentication_view.dart';
import 'package:cardinal_quotes_app/home/audios/rest_api_all_sounds/hooks/fetch/fetch_sounds_by_category.dart';
import 'package:cardinal_quotes_app/home/controller/bottom_nav_notifier.dart';
import 'package:cardinal_quotes_app/home/audios/sleepsounds/widgets/top_header.dart';
import 'package:cardinal_quotes_app/home/visuals/wallpapers/widgets/details_s.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';

class AllSoundsView extends HookWidget {
  const AllSoundsView({super.key});

  @override
  Widget build(BuildContext context) {
    String? accessToken=GetStorage().read('accessToken');
     if(accessToken==null){
      return AuthenticationView();
     }
       final check= context.read<BottomNavNotifier>().getSoundCategory.isNotEmpty?context.read<BottomNavNotifier>().getSoundCategory:'sleeping_sounds';
   
    final result = fetchSoundsByCategory(
      check
    );
    final refetch=result.refetch;
    if (result.isLoading) {
      return Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    if (result.error != null) {
      return Center(child: Text("Error: ${result.error}"));
    }

    if (result.sounds.isEmpty || result.sounds.first.data.isEmpty) {
      return const Center(child: Text("No sounds found"));
    }
    final audioItems = result.sounds.first.data;
    refetch();
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 181, 25, 14),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
               TopHeader(headerTitle:context.read<BottomNavNotifier>().soundViewTitle),
              const SizedBox(height: 13),
              Expanded(
                child: Builder(
                  builder: (context) {
                    return ListView.builder(
                      itemCount: audioItems.length,
                      itemBuilder: (context, i) {
                        final item = audioItems[i];
                        return DetailsS(item: item);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

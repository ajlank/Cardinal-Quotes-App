import 'package:cardinal_quotes_app/home/controller/bottom_nav_notifier.dart';
import 'package:cardinal_quotes_app/home/medicinenotes/views/to_dos.dart';
import 'package:cardinal_quotes_app/home/meditation/views/meditation_view.dart';
import 'package:cardinal_quotes_app/home/notes/views/notes_create_view.dart';
import 'package:cardinal_quotes_app/home/quotes/views/memorial_cards.dart';
import 'package:cardinal_quotes_app/home/quotes/views/soul_check_in.dart';
import 'package:cardinal_quotes_app/home/quotes/views/top_quotes_view.dart';
import 'package:cardinal_quotes_app/home/sacredJournals/views/sacred_journals.dart';
import 'package:cardinal_quotes_app/home/save/views/save_view.dart';
import 'package:cardinal_quotes_app/home/widgets/bottom_nav_wid.dart';
import 'package:cardinal_quotes_app/home/sleepsounds/views/sleep_sounds_view.dart';
import 'package:cardinal_quotes_app/home/sleepsounds/views/sound_details.dart';
import 'package:cardinal_quotes_app/home/soulcheckin/views/soul_checkin_view.dart';
import 'package:cardinal_quotes_app/home/medicinenotes/views/create_todos.dart';
import 'package:cardinal_quotes_app/home/wallpapers/wallpaper_view.dart';
import 'package:cardinal_quotes_app/home/widgets/body_items.dart';
import 'package:cardinal_quotes_app/home/widgets/bottom_nav_wid/home_view_wid.dart';
import 'package:cardinal_quotes_app/home/widgets/item_builder.dart';
import 'package:cardinal_quotes_app/home/widgets/resuable/home/features/announcement.dart';
import 'package:cardinal_quotes_app/home/widgets/resuable/home/features/feature_memorial_cards.dart';
import 'package:cardinal_quotes_app/home/widgets/resuable/home/features/feature_wallpaper.dart';
import 'package:cardinal_quotes_app/home/widgets/resuable/home/features/featured_quotes.dart';
import 'package:cardinal_quotes_app/home/widgets/resuable/home/features/turn_on_feature_quotes.dart';
import 'package:cardinal_quotes_app/home/widgets/resuable/home/features/turn_on_feature_wallpaper.dart';
import 'package:cardinal_quotes_app/utils/appRoutes/constants/constant.dart';
import 'package:cardinal_quotes_app/utils/data/data_app_barr.dart';
import 'package:cardinal_quotes_app/utils/data/data_body_items.dart';
import 'package:flutter/material.dart';
import 'package:cardinal_quotes_app/home/widgets/drawerpart.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => BottomNavNotifier()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cardinal Quotes',
      theme: ThemeData(
        
      ),
      home:HomeView(),
      routes: {
        sleepSoundsRoute: (context) => SleepSoundsView(),
        soundDetailsRoute: (context) => SoundDetails(),
        wallpaperRoute: (context) => WallPaperView(),
        meditationRoute:(context)=>MeditationView(),
        topQuotesRoute:(context)=>TopQuotesView(),
        sacredJournalsRoute:(context)=>SacredJournals(),
        noteCreateRoute:(context)=>NotesCreateView(),
        soulCheckInRoute:(context)=>SoulCheckinView(),
        todosRoute:(context)=>ToDos(),
        createTodosRoute:(context)=>CreateTodos(),
        saveRoute:(context)=>SaveView(),
        memorialRoute:(context)=>MemorialCards(),
        scRoute:(context)=>SoulCheckIn()
      },
    );
  }
}

class HomeView extends StatelessWidget {
  HomeView({super.key});

 final List<Widget>views=[
  HomeViewWid(),
  SleepSoundsView(),
  SoulCheckIn(),
  TopQuotesView(),
 ];
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
         
          bottomNavigationBar: BottomNavWid(),
          

          backgroundColor: const Color.fromARGB(255, 181, 25, 14),
          body: SafeArea(
            child: views[context.watch<BottomNavNotifier>().currentIndex]
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
                                context.read<BottomNavNotifier>().setIsClosed(
                                  false,
                                );
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
                                activeTrackColor: Color(0xFF4A3A2A),
                                value: context
                                    .watch<BottomNavNotifier>()
                                    .switchOn,
                                onChanged: (v) {
                                  context
                                      .read<BottomNavNotifier>()
                                      .toggleTurnedOn();
                                  context
                                      .read<BottomNavNotifier>()
                                      .toggleSwitch();
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

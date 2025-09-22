import 'package:cardinal_quotes_app/auth/controller/auth_controller.dart';
import 'package:cardinal_quotes_app/auth/views/login_view.dart';
import 'package:cardinal_quotes_app/auth/views/authentication_view.dart';
import 'package:cardinal_quotes_app/home/controller/bottom_nav_notifier.dart';
import 'package:cardinal_quotes_app/home/medicinenotes/views/to_dos.dart';
import 'package:cardinal_quotes_app/home/meditation/views/meditation_view.dart';
import 'package:cardinal_quotes_app/home/notes/views/notes_create_view.dart';
import 'package:cardinal_quotes_app/home/quotes/views/memorial_cards.dart';
import 'package:cardinal_quotes_app/home/quotes/views/soul_check_in.dart';
import 'package:cardinal_quotes_app/home/quotes/views/top_quotes_view.dart';
import 'package:cardinal_quotes_app/home/sacredJournals/views/sacred_journals.dart';
import 'package:cardinal_quotes_app/home/save/views/save_view.dart';
import 'package:cardinal_quotes_app/home/save_backends/controller/post_save_controller.dart';
import 'package:cardinal_quotes_app/home/widgets/bottom_nav_wid.dart';
import 'package:cardinal_quotes_app/home/sleepsounds/views/all_sounds_view.dart';
import 'package:cardinal_quotes_app/home/sleepsounds/views/sound_details.dart';
import 'package:cardinal_quotes_app/home/soulcheckin/views/soul_checkin_view.dart';
import 'package:cardinal_quotes_app/home/medicinenotes/views/create_todos.dart';
import 'package:cardinal_quotes_app/home/wallpapers/wallpaper_view.dart';
import 'package:cardinal_quotes_app/home/widgets/bottom_nav_wid/home_view_wid.dart';
import 'package:cardinal_quotes_app/utils/appRoutes/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => BottomNavNotifier()),
        ChangeNotifierProvider(create: (context) => AuthController()),
        ChangeNotifierProvider(create: (context) => PostSaveController()),
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
      home:RootApp(),
      routes: {
        allSoundsRoute: (context) => AllSoundsView(),
        soundDetailsRoute: (context) => SoundDetails(),
        wallpaperRoute: (context) => WallPaperView(),
        meditationRoute:(context)=>MeditationView(),
        topQuotesRoute:(context)=>QuotesView(),
        sacredJournalsRoute:(context)=>SacredJournals(),
        noteCreateRoute:(context)=>NotesCreateView(),
        soulCheckInRoute:(context)=>SoulCheckinView(),
        todosRoute:(context)=>ToDos(),
        createTodosRoute:(context)=>CreateTodos(),
        saveRoute:(context)=>SaveView(),
        memorialRoute:(context)=>MemorialCards(),
        scRoute:(context)=>SoulCheckIn(),
        signUpRoute:(context)=>AuthenticationView(),
        loginRoute:(context)=>LoginView(),
        homeRoute:(context)=>HomeView()
      },
    );
  }
}
class RootApp extends StatelessWidget {
  const RootApp({super.key});

  @override
  Widget build(BuildContext context) {
     String? accessToken=GetStorage().read('accessToken');
     if(accessToken==null){
      return AuthenticationView();
     }else{
      return HomeView();
     }
    
  }
}

class HomeView extends StatelessWidget {
  HomeView({super.key});

 final List<Widget>views=[
  HomeViewWid(),
  AllSoundsView(),
  SoulCheckIn(),
  QuotesView(),
 ];
  @override
  Widget build(BuildContext context) {
     String? accessToken=GetStorage().read('accessToken');
     if(accessToken==null){
      return AuthenticationView();
     }
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


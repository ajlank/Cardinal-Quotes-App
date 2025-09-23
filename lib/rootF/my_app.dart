import 'package:cardinal_quotes_app/auth/views/authentication_view.dart';
import 'package:cardinal_quotes_app/auth/views/login_view.dart';
import 'package:cardinal_quotes_app/home/audios/meditation/views/meditation_view.dart';
import 'package:cardinal_quotes_app/home/audios/sleepsounds/views/all_sounds_view.dart';
import 'package:cardinal_quotes_app/home/audios/sleepsounds/views/sound_details.dart';
import 'package:cardinal_quotes_app/home/quotes/medicinenotes/views/create_todos.dart';
import 'package:cardinal_quotes_app/home/quotes/medicinenotes/views/to_dos.dart';
import 'package:cardinal_quotes_app/home/quotes/notes/views/notes_create_view.dart';
import 'package:cardinal_quotes_app/home/quotes/notes/views/update_note_view.dart';
import 'package:cardinal_quotes_app/home/quotes/sacredJournals/views/sacred_journals.dart';
import 'package:cardinal_quotes_app/home/quotes/sacredJournals/views/search_view.dart';
import 'package:cardinal_quotes_app/home/quotes/soulcheckin/views/soul_checkin_view.dart';
import 'package:cardinal_quotes_app/home/quotes/views/memorial_cards.dart';
import 'package:cardinal_quotes_app/home/quotes/views/soul_check_in.dart';
import 'package:cardinal_quotes_app/home/quotes/views/top_quotes_view.dart';
import 'package:cardinal_quotes_app/home/save/views/save_view.dart';
import 'package:cardinal_quotes_app/home/visuals/wallpapers/wallpaper_view.dart';
import 'package:cardinal_quotes_app/rootF/home_view.dart';
import 'package:cardinal_quotes_app/rootF/root_app.dart';
import 'package:cardinal_quotes_app/utils/appRoutes/constants/constant.dart';
import 'package:flutter/material.dart';

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
        homeRoute:(context)=>HomeView(),
        updateNoteRoute:(context)=>UpdateNoteView(),
        searchViewRoute:(context)=>SearchView(),

      },
    );
  }
}
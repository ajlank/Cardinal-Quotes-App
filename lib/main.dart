import 'package:cardinal_quotes_app/auth/controller/auth_controller.dart';
import 'package:cardinal_quotes_app/home/controller/bottom_nav_notifier.dart';
import 'package:cardinal_quotes_app/home/quotes/notes/controller/note_controller.dart';
import 'package:cardinal_quotes_app/home/quotes/sacredJournals/controller/user_search_controller.dart';
import 'package:cardinal_quotes_app/home/quotes/save_backends/controller/post_save_controller.dart';
import 'package:cardinal_quotes_app/rootF/my_app.dart';
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
        ChangeNotifierProvider(create: (context) => NoteController()),
        ChangeNotifierProvider(create: (context) =>UserSearchController()),
      ],
      child: const MyApp(),
    ),
  );
}





import 'package:cardinal_quotes_app/rootF/home_view.dart';
import 'package:flutter/material.dart';
import 'package:cardinal_quotes_app/auth/views/authentication_view.dart';
import 'package:get_storage/get_storage.dart';
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
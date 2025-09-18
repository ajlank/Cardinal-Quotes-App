import 'package:flutter/material.dart';

class BottomNavNotifier extends ChangeNotifier{

   int _index=0;
   bool _switchOn=false;
   bool _isClosed=false;
   
   void setIsClosed(bool val){
   _isClosed=val;
   notifyListeners();
   }
   void setIndex(int i){
    _index=i;
    notifyListeners();
   }
   int get currentIndex=>_index;
   bool get isClosed=>_isClosed;
void toggleSwitch(){
    _switchOn=!_switchOn;
    notifyListeners();
  }

  bool get switchOn=>_switchOn;

}
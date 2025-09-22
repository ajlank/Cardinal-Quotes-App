import 'package:flutter/material.dart';

class BottomNavNotifier extends ChangeNotifier {
  int _index = 0;
  int _id = 0;

  bool _switchOn = false;
  bool _isClosed = false;
  bool _turnedOn = false;

  bool _isClicked = false;
  int _selectedTabIndex = 0;

  String _soundCategory='';
  String _soundViewTitle='';
  
  String _quotesCategory='';
  String _quotesViewTitle='';
  String _visualCategory='';
  String _visualViewTitle='';
  bool isClickedd = false; 
  int? selectedItemIds; 

  void setSelectedItem(int id) {
    selectedItemIds = id; 
    isClickedd = true; 
    notifyListeners();
  }
 void setIsClickedd(bool f){
     selectedItemIds = null; 
  isClickedd=f;
  notifyListeners();
 }

  void setQuotesCategoryAndTitle(String n,String title){
    _quotesCategory=n;
    _quotesViewTitle=title;
    notifyListeners();
  }

  void setVisualCategoryAndTitle(String n, String t){
    _visualCategory=n;
    _visualViewTitle=t;
    notifyListeners();
  }
   
  String get getVisualCategory=>_visualCategory;
 String get getQuotesViewTitle=>_quotesViewTitle;

  String get getQuotesCategory=>_quotesCategory;
 String get getVisualViewTitle=>_visualViewTitle;
  
  void setSoundCategoryAndTitle(String category,String title){
   _soundCategory=category;
   _soundViewTitle=title;
   notifyListeners();
  }

  void setSoundViewTitle(String n){
    _soundViewTitle=n;
    notifyListeners();
  }

  String get soundViewTitle=>_soundViewTitle;

  String get getSoundCategory=>_soundCategory;
  
  int get selectedTabIndex => _selectedTabIndex;

  void setTabIndex(int index) {
    _selectedTabIndex = index;
    notifyListeners();
  }

  void setIsClicked(bool f) {
    _isClicked = f;
    notifyListeners();
  }

  bool get isClicked => _isClicked;
  void setId(int i) {
    _id = i;
    notifyListeners();
  }

  int get getId => _id;

  void toggleTurnedOn() {
    _turnedOn = !_turnedOn;
    notifyListeners();
  }

  bool get turnedOn => _turnedOn;

  void setIsClosed(bool val) {
    _isClosed = val;
    notifyListeners();
  }

  void setIndex(int i) {
    _index = i;
    notifyListeners();
  }

  int get currentIndex => _index;
  bool get isClosed => _isClosed;
  void toggleSwitch() {
    _switchOn = !_switchOn;
    notifyListeners();
  }

  bool get switchOn => _switchOn;
}

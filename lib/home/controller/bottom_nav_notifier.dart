import 'package:flutter/material.dart';

class BottomNavNotifier extends ChangeNotifier {
  int _index = 0;
  int _id = 0;

  bool _switchOn = false;
  bool _isClosed = false;
  bool _turnedOn = false;

  bool _isClicked = false;
  int _selectedTabIndex = 0;

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

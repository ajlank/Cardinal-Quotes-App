import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class NoteController extends ChangeNotifier {
  bool _isClicked = false;
  String _title='';
  String _note='';
  int _noteId=0;

  void setTitleAndNote(String t, String n,int id){
    _title=t;
    _note=n;
    _noteId=id;
    notifyListeners();
  }

  void clearTitleAndNote(){
    _title='';
     _note='';
    _noteId=0;
    notifyListeners();
  }

  int get noteId=>_noteId;

  String get getTitle=>_title;
  String get getNote=>_note;

  void setIsClicked(bool f) {
    _isClicked = f;
    notifyListeners();
  }

  bool get isClicked => _isClicked;

  void createNote(String data) async {
    String token = GetStorage().read('accessToken');
    try {
      var url = Uri.parse(
        'https://cardinaldailyquotes.com/api/users/notes/upload',
      );

      var response = await http.post(
        url,
        headers: {
          'authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        body: data,
      );

      if (response.statusCode == 200) {
        print(response.body);
      }
    } catch (e) {
      print(e);
    }
  }
   void updateNote(String data,int noteId) async {
    String token = GetStorage().read('accessToken');
    try {
      var url = Uri.parse(
        'https://cardinaldailyquotes.com/api/users/notes/update/$noteId',
      );

      var response = await http.put(
        url,
        headers: {
          'authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        body: data,
      );

      if (response.statusCode == 200) {
        
        print(response.body);
      }
    } catch (e) {
      print(e);
    }
  }
}

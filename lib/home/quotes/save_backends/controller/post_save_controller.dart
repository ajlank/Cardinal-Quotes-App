import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class PostSaveController extends ChangeNotifier{

   
 void savePost(String item, int id) async {
    String token = GetStorage().read('accessToken');
    try {
      Uri url = Uri.parse("https://cardinaldailyquotes.com/api/users/save/$item/$id");

      final response = await http.post(
        url,
        headers: {
          'authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
       
      );

      if (response.statusCode == 200) {
        print('success');
      }
    } catch (e) {
      print(e.toString());
    }
  }

}
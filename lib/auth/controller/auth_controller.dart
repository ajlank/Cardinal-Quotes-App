import 'package:cardinal_quotes_app/auth/models/token_model.dart';
import 'package:cardinal_quotes_app/utils/appRoutes/constants/constant.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class AuthController with ChangeNotifier{
  int _index=0;
   bool _isloading = false;

  bool get isloading => _isloading;

  void setLoading() {
    _isloading = !_isloading;
    notifyListeners();
  }

  void setIndex(int n){
    _index=n;
    notifyListeners();
  }

  int get getIndex=>_index;

  void registerFunc(String data) async {
     setLoading();
    try {
      var url = Uri.parse('https://cardinaldailyquotes.com/api/users/register');

      var response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: data,
      );

      if(response.statusCode==200){
        String accessToken=tokenModelFromJson(response.body).token;
        GetStorage().write('accessToken', accessToken);
 
      }else if(response.statusCode==400){
         setLoading(); 
      
      }
    } catch (e) {
      setLoading();
      print(e);
    
    }
  }
  
  void loginFunc(String data, BuildContext ctx) async {
    setLoading();
    try {
      var url = Uri.parse('https://cardinaldailyquotes.com/api/users/login');
      var response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: data,
      );

      if(response.statusCode==200){
        String accessToken=tokenModelFromJson(response.body).token;
        String status=tokenModelFromJson(response.body).status;
        GetStorage().write('accessToken', accessToken);
        Navigator.of(ctx).pushNamedAndRemoveUntil(homeRoute, (_)=>false);
      }
    } catch (e) {
      setLoading();
      //showerror popup
    }
  }

}
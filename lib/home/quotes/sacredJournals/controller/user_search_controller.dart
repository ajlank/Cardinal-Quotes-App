import 'dart:convert';
import 'package:cardinal_quotes_app/home/quotes/save_backends/model/save_post_response.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UserSearchController with ChangeNotifier {
  bool _isLoading = false;
  List<Audio> _audios = [];
  List<Quote> _quotes = [];
  List<Visual> _visuals = [];

  String _searchKey = '';
  String _error = '';

  bool get isLoading => _isLoading;
  List<Audio> get audios => _audios;
  List<Quote> get quotes => _quotes;
  List<Visual> get visuals => _visuals;
  String get searchKey => _searchKey;
  String get error => _error;

  void setSearchKey(String k) {
    _searchKey = k;
    notifyListeners();
  }

  void setLoading(bool v) {
    _isLoading = v;
    notifyListeners();
  }

  void setError(String e) {
    _error = e;
    notifyListeners();
  }

  void clearResults() {
    _audios = [];
    _quotes = [];
    _visuals = [];
    notifyListeners();
  }

  Future<void> searchFunction(String searchKey) async {
    setLoading(true);
    setSearchKey(searchKey);

    final url = Uri.parse(
        "https://cardinaldailyquotes.com/api/users/keywords/${Uri.encodeComponent(searchKey)}");

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        
        final decoded = jsonDecode(response.body);
        if (decoded["status"] == "success") {
          final data = SavedData.fromJson(decoded["data"]);
          _audios = data.audios;
          _quotes = data.quotes;
          _visuals = data.visuals;
          setError('');
        } else {
          setError(decoded["status"] ?? "Unknown error");
        }
      } else {
        setError("HTTP error: ${response.statusCode}");
      }
    } catch (e) {
      setError(e.toString());
    } finally {
      setLoading(false);
    }
  }
}

import 'package:http/http.dart' as http;
import 'dart:convert';

Future<void> increaseView(String itemType, int itemId) async {
  try {
   
    final url = Uri.parse(
        'https://cardinaldailyquotes.com/api/users/view/$itemType/$itemId');

    final response = await http.put(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (data['status'] == 'success') {
        print('Successfully updated');
      } else {
        print('Error: ${data['status']}');
      }
    } else {
      print('HTTP error: ${response.statusCode}');
    }
  } catch (e) {
    print(' error: $e');
  }
}

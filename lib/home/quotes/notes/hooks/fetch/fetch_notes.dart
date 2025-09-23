import 'package:cardinal_quotes_app/home/quotes/notes/hooks/result/fetch_notes_result.dart';
import 'package:cardinal_quotes_app/home/quotes/notes/model/get_note_model.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

FetchNotesResult fetchNotes(){

  final myNotes= useState<List<Dt>>([]);
  final isLoading = useState(false);
  final error = useState<String?>(null);

  Future<void> fetchData() async {
    isLoading.value = true;  
    String token = GetStorage().read('accessToken');

    try {
      final url = Uri.parse("https://cardinaldailyquotes.com/api/users/notes");
      final response = await http.get(url,
          headers: {
          'authorization': 'Bearer $token',

        },
      );

      if (response.statusCode == 200) {
        myNotes.value=getNoteModelFromJson(response.body).data;
      } else {
        error.value = "HTTP error: ${response.statusCode}";
      }
    } catch (e) {
      error.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  void refetch(){
    fetchData();
    isLoading.value=false;
  }

  useEffect(() {
    fetchData();
    return null;
  }, const []);
  return FetchNotesResult(notes: myNotes.value, isLoading: isLoading.value, error: error.value, refetch: refetch);
}
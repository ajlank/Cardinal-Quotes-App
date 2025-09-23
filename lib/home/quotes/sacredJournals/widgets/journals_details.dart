import 'package:cardinal_quotes_app/home/quotes/notes/controller/note_controller.dart';
import 'package:cardinal_quotes_app/home/quotes/notes/model/get_note_model.dart';
import 'package:cardinal_quotes_app/utils/appRoutes/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class JournalsDetails extends StatelessWidget {
  final List<Color> colors = [
    Color.fromARGB(255, 148, 240, 252),
    Color.fromARGB(255, 235, 236, 166),
    Color.fromARGB(255, 243, 174, 255),
    Color.fromARGB(255, 4, 1, 1),
    Color.fromARGB(255, 199, 235, 240),
  ];

  final int i;
  final Dt data;
  JournalsDetails({super.key, required this.i, required this.data});
  
  @override
  Widget build(BuildContext context) {
    final wid = MediaQuery.of(context).size.width;

    return Hero(
      tag: 'top101',
      child: GestureDetector(
        onTap: () {
          context.read<NoteController>().setTitleAndNote(data.title,data.note,data.id);
          Navigator.of(context).pushNamed(updateNoteRoute);
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Container(
            width: wid * 0.9,
            padding: const EdgeInsets.all(16), 
            decoration: BoxDecoration(
              color: colors[i % colors.length],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center, 
              crossAxisAlignment: CrossAxisAlignment.center, 
              children: [
                Text(
                  data.title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: (i==3)?Colors.white:Colors.black
                  ),
                ),
                SizedBox(height: 8),
                Text(
                 data.note,
                  textAlign: TextAlign.center, 
                  style: TextStyle(fontSize: 14, height: 1.5,
                  color: (i==3)?Colors.white:Colors.black
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

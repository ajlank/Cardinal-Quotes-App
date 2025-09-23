import 'package:cardinal_quotes_app/home/quotes/notes/controller/note_controller.dart';
import 'package:cardinal_quotes_app/home/quotes/notes/model/note_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UpdateNoteView extends StatefulWidget {
  const UpdateNoteView({super.key});

  @override
  State<UpdateNoteView> createState() => _UpdateNoteViewState();
}

class _UpdateNoteViewState extends State<UpdateNoteView> {
  late final TextEditingController _titleController;
  late final TextEditingController _noteController;

  @override
  void initState() {
    _titleController = TextEditingController(text: context.read<NoteController>().getTitle);
    _noteController = TextEditingController(text: context.read<NoteController>().getNote);
    super.initState();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final wid = MediaQuery.of(context).size.width;
    
    return Scaffold(
      resizeToAvoidBottomInset: true,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: wid * .80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.brown,
              ),
              height: 60,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset('assets/body_grid_items/items/1.png'),
                      Image.asset('assets/body_grid_items/items/2.png'),
                      Image.asset('assets/body_grid_items/items/3.png'),
                      Image.asset('assets/body_grid_items/items/4.png'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 100),
                        child: Text(
                          'Edited 11 may 2025 11:41 pm',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 15,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Image.asset(
                            'assets/body_grid_items/arrow_r.png',
                          ),
                        ),
                        Image.asset('assets/body_grid_items/draw_er.png'),
                      ],
                    ),
                    const SizedBox(height: 12),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                    Column(
                                children: [
                                  TextField(
                                    controller: _titleController,
                                    decoration: InputDecoration(
                                      hintText: 'Title',
                                    ),
                                  ),
                                  TextField(
                                    controller: _noteController,
                                    decoration: InputDecoration(
                                      hintText: 'Your note',
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ElevatedButton(
                                        onPressed: () {
                                          if(_noteController.text.isEmpty || _titleController.text.isEmpty ){
                                            return;
                                          }
                                          NoteModel notes=NoteModel(note: _noteController.text,
                                           title: _titleController.text);

                                           String data=noteModelToJson(notes);
                                           context.read<NoteController>().updateNote(data,context.read<NoteController>().noteId);
                                            Navigator.of(context).pop();
                                          setState(() {
                                             _titleController.text='';
                                           _noteController.text='';
                                          });
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.brown,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              12,
                                            ),
                                          ),
                                        ),
                                        child: const Text(
                                          'Update Note',
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            Image.asset(
              'assets/body_grid_items/bottom_bg.png',
              width: wid,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}

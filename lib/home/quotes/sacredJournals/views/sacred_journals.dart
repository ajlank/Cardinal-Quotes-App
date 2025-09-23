import 'package:cardinal_quotes_app/home/quotes/notes/hooks/fetch/fetch_notes.dart';
import 'package:cardinal_quotes_app/home/quotes/sacredJournals/widgets/journals_details.dart';
import 'package:cardinal_quotes_app/home/quotes/sacredJournals/widgets/top_hd_two.dart';
import 'package:cardinal_quotes_app/utils/appRoutes/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class SacredJournals extends HookWidget {
  const SacredJournals({super.key});

  @override
  Widget build(BuildContext context) {
    final result= fetchNotes();
    final refetch=result.refetch;
    if(result.isLoading){
     return Scaffold(
      body: Center(
      child:CircularProgressIndicator() 
     
     )); 
    }
    final notes=result.notes;
    refetch();
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 40),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(noteCreateRoute);
          },
          child: CircleAvatar(
            radius: 30, 
            backgroundColor: Color.fromARGB(255, 241, 233, 172),
            child: Image.asset(
              'assets/body_grid_items/addPhoto.png',
              width: 30,
              height: 30,
            ),
          ),
        ),
      ),

      backgroundColor: const Color.fromARGB(255, 181, 25, 14),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Column(
            children: [
              TopHdTwo(topHd: 'Sacred Journals',),
              SizedBox(height: 13),
              Expanded(
                child: ListView.builder(
                  itemCount: notes.length,
                  itemBuilder: (context, i) {
                      var note=notes[i];
                    return JournalsDetails(i: i, data: note,);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

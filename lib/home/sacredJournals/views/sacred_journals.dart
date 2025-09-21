import 'package:cardinal_quotes_app/home/sacredJournals/widgets/journals_details.dart';
import 'package:cardinal_quotes_app/home/sacredJournals/widgets/top_hd_two.dart';
import 'package:cardinal_quotes_app/utils/appRoutes/constants/constant.dart';
import 'package:flutter/material.dart';

class SacredJournals extends StatelessWidget {
  const SacredJournals({super.key});

  @override
  Widget build(BuildContext context) {
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
              TopHdTwo(),
              SizedBox(height: 13),
              Expanded(
                child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, i) {
                    return JournalsDetails(i: i);
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

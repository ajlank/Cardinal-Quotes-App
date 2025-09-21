import 'package:flutter/material.dart';

class NotesCreateView extends StatelessWidget {
  const NotesCreateView({super.key});

  @override
  Widget build(BuildContext context) {
    final wid = MediaQuery.of(context).size.width;

    return Scaffold(
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
                        child: Text('Edited 11 may 2025 11:41 pm',style: TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.w500),),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
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
                        child: Image.asset('assets/body_grid_items/arrow_r.png'),
                      ),
                      Image.asset('assets/body_grid_items/draw_er.png'),
                    ],
                  ),
                  const SizedBox(height: 12),
            
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('Title',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold,color: Colors.brown)),
                      Text('Note',
                          style: TextStyle(
                              fontSize: 14, color: Colors.grey)),
                    ],
                  ),
                ],
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

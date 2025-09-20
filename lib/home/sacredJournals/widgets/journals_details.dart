import 'package:flutter/material.dart';

class JournalsDetails extends StatelessWidget {
  final List<Color> colors = [
    Color.fromARGB(255, 148, 240, 252),
    Color.fromARGB(255, 235, 236, 166),
    Color.fromARGB(255, 243, 174, 255),
    Color.fromARGB(255, 4, 1, 1),
    Color.fromARGB(255, 199, 235, 240),
  ];

  final int i;

  JournalsDetails({super.key, required this.i});

  @override
  Widget build(BuildContext context) {
    final wid = MediaQuery.of(context).size.width;

    return Hero(
      tag: 'top101',
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Container(
          width: wid * 0.9,
          padding: const EdgeInsets.all(16), 
          decoration: BoxDecoration(
            color: colors[i],
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, 
            crossAxisAlignment: CrossAxisAlignment.center, 
            children: [
              Text(
                'My Story',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: (i==3)?Colors.white:Colors.black
                ),
              ),
              SizedBox(height: 8),
              Text(
                "Lorem Ipsum is simply dummy text to make a type specimen book. "
                "It has survived not only five centuries, but also the leap into electronic typesetting, "
                "remaining essentially unchanged.",
                textAlign: TextAlign.center, 
                style: TextStyle(fontSize: 14, height: 1.5,
                color: (i==3)?Colors.white:Colors.black
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class MemorialWidget extends StatelessWidget {
  const MemorialWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 181, 25, 14),
      body: Center(
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Center(
          child: Text(
            "Memorial Cards Tab",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      ),
    ),
    );
  }
}
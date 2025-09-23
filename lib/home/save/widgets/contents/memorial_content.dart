import 'package:flutter/material.dart';

class MemorialContent extends StatelessWidget {
  const MemorialContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
        
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Center(
          child: Text(
            "Memorial Cards Tab",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      ),
    );
  }
}
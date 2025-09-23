import 'package:flutter/material.dart';

class SearchTopHeader extends StatelessWidget {
  const SearchTopHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 15),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: Image.asset('assets/sleep_sounds/right_arrow.png',color: Colors.black,),
          ),
          const SizedBox(width: 10),
          const Text(
            'Search',
            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
          ),
        ],
      ),
    );
  }
}